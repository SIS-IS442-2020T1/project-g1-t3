package g1t3.webserviceBackend;

import g1t3.entity.*;
import g1t3.repository.WebserviceRepository;
import g1t3.service.*;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.io.*;
import java.util.List;
import java.util.concurrent.ScheduledFuture;


import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;
import org.springframework.scheduling.support.CronTrigger;

import javax.annotation.PostConstruct;

@Component
public class ScheduleTaskDaily implements Runnable{

    @SuppressWarnings("rawtypes")
    ScheduledFuture scheduledFuture;
    TaskScheduler taskScheduler ;

    private static final Logger log = LoggerFactory.getLogger(ScheduleTaskDaily.class);

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    @Autowired
    private VesselService serviceVessel;

    @Autowired
    private WebserviceService service;

    @Autowired
    private EmailServerService emailServerService;

    @Autowired
    private WebserviceRepository repository;

    @Autowired
    private DetectTimeChangeAndEmail timeDetectionService;

    public String getDailyFixedRate(int id){
        WebserviceInstructions webserviceInstructionsById = service.getWebserviceById(id);
        return webserviceInstructionsById.getDailyUpdate();
    }

    public String getApiKey(int id){
        WebserviceInstructions webserviceInstructionsById = service.getWebserviceById(id);
        return webserviceInstructionsById.getApiKey();
    }

    public void replaceDataForDaily(List<Vessel> vesselList){
        serviceVessel.saveVessels(vesselList);
    }

    public void reSchedule(String cronExpressionStr){
        if(taskScheduler== null){
            this.taskScheduler = new ConcurrentTaskScheduler();
        }
        if (this.scheduledFuture != null) {
            this.scheduledFuture.cancel(true);
        }
        this.scheduledFuture = this.taskScheduler.schedule(this, new CronTrigger(cronExpressionStr));
    }

    @Override
    public  void run(){
// task to be performed
        log.info("The time is now {}", dateFormat.format(new Date()));
        String encodedString = getApiKey(1);
        byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
        String apiKey = new String(decodedBytes);
        LocalDate now = LocalDate.now();
        LocalDate start = now.plusDays(1);
        LocalDate end = now.plusDays(6);
        String command = "curl -X POST \"https://api.pntestbox.com/vsspp/pp/bizfn/berthingSchedule/retrieveByBerthingDate/v1.2\" -H \"accept: application/json\" -H \"Apikey: " + apiKey + "\" -H \"content-type: application/json\" -d \"{ \\\"dateFrom\\\":\\\"" + start.toString() + "\\\", \\\"dateTo\\\":\\\"" + end.toString() + "\\\"}\\\"";
        String readLine = null;
        StringBuffer response = new StringBuffer();
        Gson gson = new Gson();
        try(BufferedReader reader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(command).getInputStream()))) {
            while ((readLine = reader.readLine()) != null) {
                response.append(readLine);
            }
            JSONObject json = new JSONObject(response.toString());
            JSONArray jsonArray = json.getJSONArray("results");
            List<Vessel> vesselList = new ArrayList<>();
            for (int i = 0, size = jsonArray.length(); i < size; i++){
                JSONObject objectInArray = jsonArray.getJSONObject(i);
                Vessel newVessel= gson.fromJson(objectInArray.toString(), Vessel.class);
                Vessel existingVessel = timeDetectionService.getExistingVessel(newVessel);
                timeDetectionService.operationsUponBerthTimeChange(newVessel,existingVessel, vesselList);
                timeDetectionService.toEmailIfBerthOrDepartTimeChange(newVessel,existingVessel);
            }
//            System.out.println(vesselList.toString());
            replaceDataForDaily(vesselList);

        } catch (JSONException e) {
            System.out.println("Api link is currently down");
//            System.out.printf("Error");
        } catch (Exception e){
            e.printStackTrace();
        }
        finally {
            initializeScheduler();
        }
    }

    @PostConstruct
    public void initializeScheduler() {
        //@postcontruct method will be called after creating all beans in application context
        // read user config map from db
        // get cron expression create
        this.reSchedule(getDailyFixedRate(1));
//        this.reSchedule("* * * ? * *");
    }
}
