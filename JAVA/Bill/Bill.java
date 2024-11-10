package Bill;

import java.util.Scanner;
import java.util.ArrayList;

public class Bill {
    private ArrayList<Bill> All_Bills = new ArrayList<>();
    private String type;
    private double cost;
    private boolean payed=true;
    private String ID;



    public Bill()
    {
        payed =true ;
        ID ="" ;
        cost=0;
        type ="";
    }
    public Bill(String ID,String  type, double cost, boolean payed) {

        this.type = type;
        //checkType();
        this.payed = payed;
        this.ID = ID;
        this.cost=cost;

    }

    public String  getType()
    {

        return type;
    }

    public double getCost() {

        return cost;
    }

    public String getID() {

        return ID;
    }

    public boolean getpayed()
    {
        if(payed==true)
        {
            System.out.println("yes");
        }
        else
        {
            System.out.println("no");

        }
    return payed;
    }

    public void checkType() {
        if (! type.equals("phone") || ! type.equals("water") || ! type.equals("electricity"))
        {
            Scanner input = new Scanner(System.in);
            this.type=type;
            this.type=input.next();
        }
    }

    public void readBill() {
        Scanner input = new Scanner(System.in);
        System.out.println("Give ID:");
        ID = input.next();
        System.out.println("Give type:");
        type = input.next();
        //this.checkType();
        System.out.println("Give cost:");
        cost = input.nextDouble();
        System.out.println("If the bill is payed press 1 or else press 0");
        payed = input.hasNextBoolean();
        this.getpayed();

    }

    public String toString() {
        return "ID: " + ID + " type: " + type +" cost: " + cost + " payed: " + payed + "\n";

    }

}