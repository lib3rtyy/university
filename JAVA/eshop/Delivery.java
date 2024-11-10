package eshop;

import java.util.Scanner;

public class Delivery extends Goods {
    double cost_to_sent;
    double pay_on_delivery;

    public Delivery()
    {
        super();
        cost_to_sent=0;
        pay_on_delivery=0;

    }


    public Delivery(String title, int vat, double price,double cost_to_sent,double pay_on_delivery)
    {
        super(title,vat,price);
        this.cost_to_sent=cost_to_sent;
        this.pay_on_delivery= pay_on_delivery;
    }

    public void ReadDelivery()
    {
        Scanner in=new Scanner(System.in);
        System.out.println("Give cost to send:");
        cost_to_sent=in.nextDouble();
        System.out.println("Give Cash On Delivery:");
        pay_on_delivery=in.nextDouble();

    }

    public String toString(){
        return super.toString()+"Cost to send:"+cost_to_sent+" \n"+"Pay on delivery:"+pay_on_delivery+" \n";
    }

    public double calculateCost()
    {
        return super.calculateCost()+cost_to_sent+pay_on_delivery;
    }
}
