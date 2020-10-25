import java.util.*;

public class TimerTest{
    Timer timer = new Timer();
    TimerTask task = new TimerTask(){
        public void run() {
            Scanner sc = new Scanner(System.in);
            System.out.println("Data updated!");
            System.out.print("Please enter the time interval.");
            String time = sc.nextLine();
        }
    };

    public void start(){
        timer.schedule(task, 1000, 2000);
    }

    public static void main(String[] args){
        TimerTest test = new TimerTest();
        test.start();
    }

}