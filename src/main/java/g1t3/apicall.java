import java.io.*;
import java.util.Scanner;
//import java.io.InputStreamReader;
//import java.io.Reader;

public class apicall {
        public static void main(String[] args){
//            String command = "curl -X POST \"https://api.pntestbox.com/vsspp/pp/bizfn/berthingSchedule/retrieveByBerthingDate/v1.2\" -H \"accept: application/json\" -H \"Apikey: d0ceb61c5edd48ce964d65bffacf3274\" -H \"content-type: application/json\" -d \"{ \"dateFrom\": \"2020-07-14\", \"dateTo\": \"2020-07-14\"}\"";
            String command = "curl -X POST \"https://api.pntestbox.com/vsspp/pp/bizfn/berthingSchedule/retrieveByBerthingDate/v1.2\" -H \"accept: application/json\" -H \"Apikey: d0ceb61c5edd48ce964d65bffacf3274\" -H \"content-type: application/json\" -d \"{ \\\"dateFrom\\\": \\\"2020-07-14\\\", \\\"dateTo\\\": \\\"2020-07-14\\\"}\"";
            String readLine = null;
            StringBuffer response = new StringBuffer();
            try(BufferedReader reader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(command).getInputStream()))){
                while((readLine = reader.readLine()) != null){
                    response.append(readLine);
                }
            } catch (Exception e) {
//                e.printStackTrace();
                System.out.printf("Error");
            }
            System.out.println(response);

            //     int data = reader.read();
            //     System.out.println(reader.readLine()); // value is NULL
            //     String line = "";
            //     while ((line = reader.readLine()) != null) {
            //       System.out.println(line);
            //       output.append(line + "\n");
            //     }
            //   }
            // System.out.println(reader);




        }
}

