package g1t3.webserviceBackend;

import g1t3.entity.Vessel;
import g1t3.entity.WebserviceInstructions;
import g1t3.repository.WebserviceRepository;
import g1t3.service.VesselService;
import g1t3.service.WebserviceService;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.io.*;
import java.util.List;

import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
public class ScheduleTaskCurrentDay {
    private static final Logger log = LoggerFactory.getLogger(ScheduleTaskCurrentDay.class);

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    @Autowired
    private VesselService serviceVessel;

    @Autowired
    private WebserviceService service;
    private WebserviceRepository repository;

    @Autowired
    private EmailSubscribers EmailSubscribers;

    public Integer getCurrentDayFixedRate(int id){
        WebserviceInstructions webserviceInstructionsById = service.getWebserviceById(id);
        return webserviceInstructionsById.getCurrentDayUpdate();
    }

    public String getApiKey(int id){
        WebserviceInstructions webserviceInstructionsById = service.getWebserviceById(id);
        return webserviceInstructionsById.getApiKey();
    }

    public void replaceDataForCurrentDay(List<Vessel> vesselList){//, LocalDate date){
//        if(serviceVessel.checkVesselsByBthgDt(date.toString())) {
//            serviceVessel.deleteCurrentDay(date.toString());
//        }
        serviceVessel.saveVessels(vesselList);
    }

    @Scheduled(initialDelay = 1000, fixedDelay = 1000)
    public void dataForCurrentDay() throws InterruptedException {
        log.info("The time is now {}", dateFormat.format(new Date()));
        String encodedString = getApiKey(1);
        byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
        String apiKey = new String(decodedBytes);
        LocalDate date = LocalDate.now(); //"2020-07-14";
        String command = "curl -X POST \"https://api.pntestbox.com/vsspp/pp/bizfn/berthingSchedule/retrieveByBerthingDate/v1.2\" -H \"accept: application/json\" -H \"Apikey: " + apiKey + "\" -H \"content-type: application/json\" -d \"{ \\\"dateFrom\\\":\\\"" + date.toString() + "\\\", \\\"dateTo\\\":\\\"" + date.toString() + "\\\"}\\\"";
        String readLine = null;
        StringBuffer response = new StringBuffer();
        Gson gson = new Gson();
        try(BufferedReader reader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(command).getInputStream()))){
            while((readLine = reader.readLine()) != null){
                response.append(readLine);
            }
            JSONObject json = new JSONObject(response.toString());
            JSONArray jsonArray = json.getJSONArray("results");
            List<Vessel> vesselList = new ArrayList<>();
            for (int i = 0, size = jsonArray.length(); i < size; i++){
                JSONObject objectInArray = jsonArray.getJSONObject(i);
                Vessel vessel = gson.fromJson(objectInArray.toString(), Vessel.class);
                vesselList.add(vessel);
                EmailSubscribers.toEmailIfBerthOrDepartTimeChange(vessel);
            }
            replaceDataForCurrentDay(vesselList);//, date);

        } catch (JSONException e) {
            System.out.println("Api link is currently down");
//            System.out.printf("Error");
        } catch (Exception e){
            e.printStackTrace();
    }

        Thread.sleep(getCurrentDayFixedRate(1));
    }
}
