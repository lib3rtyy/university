package Bill;
import javax.swing.*;
import java.util.ArrayList;
import java.util.Scanner;

public class Expenses {
    public String[] type = {"electricity", "water", "phone"};
    private double cost;
    private boolean payed = true;
    private String ID;
    public ArrayList<Bill> All_Bills = new ArrayList<>();

    public Expenses( ArrayList<Bill> bl) {
        All_Bills = bl;
    }


    public void readReservation() {
        Bill b = new Bill();
        Scanner keyboard = new Scanner(System.in);
        b.readBill();
        All_Bills.add(b);
    }

    public double calctotal() {
        double total = 0;
        for (Bill b : All_Bills) {
            while (!b.getpayed()){
                b.getCost();
                total+=b.getCost();
            }

        }
        return total;
    }

    public  void FindUnpaid() {
        for (Bill b : All_Bills) {
            if (!b.getpayed()) {
                b.getCost();
                calctotal();
            }
            else break;
        }
    }

    public void confirmPayment(String ID) {
        for (Bill b : All_Bills) {
            while (!b.getpayed()) {
                b.getID();
                payed=true;
                All_Bills.add(b);
            }
        }
    }

    public String toString() {
        String temp = "";
        for (Bill elem : All_Bills)
            temp += elem.toString();
        return "Expenses:\n" + temp + "\n";
    }

    public  Bill findBiggerBill()
    {
        double max = All_Bills.get(0).getCost();
        for (int i = 0; i < All_Bills.size(); i++) {
            if (All_Bills.get(i).getCost() > All_Bills.get(i+1).getCost()) {
                max = All_Bills.get(i).getCost();
            }
            else
                max=All_Bills.get(i+1).getCost();
        }
        System.out.print(max);
        return All_Bills.get((int) cost);
    }


    public static void main(String[] args) {
        String[] type = {"electricity", "water", "phone"};
        double cost;
        boolean payed = true;
        String ID;

        Bill b1 = new Bill(" 2378-A, ", " electricity ", 546.2, false);
        Bill b2 = new Bill(" 34-A, ", " water ", 674.5, true);
        Bill b3 = new Bill(" AQW3r3r, ", " phone ", 54, false);
        Bill b4 = new Bill(" 789/X, ", " water ", 120.30, false);
        Bill b5 = new Bill(" Th78S, ", " electricity ", 246.2, true);
        ArrayList<Bill> All_Bills = new ArrayList<>();
        All_Bills.add(b1);
        All_Bills.add(b2);
        All_Bills.add(b3);
        All_Bills.add(b4);
        All_Bills.add(b5);
        Expenses exp = new Expenses(All_Bills);
        System.out.println("Please enter data for new bill.\n");
        exp.readReservation();
        //All_Bills.FindUnpaid;
        System.out.println(exp);
        //All_Bills.confirmPayment("789/X");
        //All_Bills.findBiggerBill();

    }
}