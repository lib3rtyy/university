package AirCondition;
import java.security.AllPermission;
import java.util.Scanner;
import java.util.Arrays;

public class AirCondition {
    private int All_Temperatures[];
    private int N;
    private int add;
    private int searchT;
    private int i;

    public AirCondition() {
        N = 0;
        All_Temperatures = new int[N];
        add = 0;
    }


    public void readAirCondition() {
        while (true) {
            Scanner input = new Scanner(System.in);
            System.out.println("Insert the number of temperatures: ");
            N = input.nextInt();
            System.out.println("Insert the place you are searching for");
            searchT = input.nextInt();
            for (i = 0; i < All_Temperatures.length; i++) {
                if (i == searchT)
                System.out.println("The number at " + searchT + " place is: " + All_Temperatures[i - 1] + "\n");
                /*try {
                    if (i == searchT)
                        throw new Exception("There is no memory at this place");
                        System.out.println("The number at " + searchT + " place is: " + All_Temperatures[i - 1] + "\n");
                } catch (Exception l) {
                    System.out.println(l.getMessage());
                    searchT = input.nextInt();
                }*/
            }
            while (N < 1) {
                try {
                    while (N < 1)
                        throw new Exception("Give at least one valid number");
                    System.out.println("Number of temperatures: " + (int) N);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    N = input.nextInt();
                }
            }
            System.out.println("Insert temperatures:");
            All_Temperatures = new int[N];
            int i;
            for (i = 0; i < N; i++) {
                All_Temperatures[i] = input.nextInt();
                try {
                    while (All_Temperatures[i] < 15 || All_Temperatures[i] > 40)
                        throw new Exception("The input is invalid");
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    All_Temperatures[i] = input.nextInt();
                }
                add = add + All_Temperatures[i];
            }

            int MO = (add / N );
            System.out.println("The MO is: " + MO);
            System.out.println("The temperatures you inserted are the following:");
            System.out.println(Arrays.toString(All_Temperatures));

        }
    }

    public static void main(String[] args) {
        AirCondition c1=new AirCondition();
        c1.readAirCondition();

    }
}
