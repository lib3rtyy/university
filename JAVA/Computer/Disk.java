package Computer;

import java.util.ArrayList;

public class Disk {
    private String name;
    private int capacity;
    private String formFactor;
    private String connectivity;
    private double price;
    ArrayList<Disk> Ds = new ArrayList<>();

    public Disk(String name, int capacity, String formFactor, String connectivity, Double price) {
        this.name = name;
        this.capacity = capacity;
        this.formFactor = formFactor;
        this.connectivity = connectivity;
        this.price = price;
    }

    public Disk() {
        name = "";
        capacity = 0;
        formFactor = "";
        connectivity = "";
        price = 0;
    }

    public String toString() {
        return "Name: " + name + " Capacity: " + capacity + " formFactor: " + formFactor + " Connectivity: " + connectivity + " Price: " + price + "\n";
    }

    public void setName(String onoma) {
        name = onoma;

    }

    public void setCapacity(int xorhtikothta) {
        capacity = xorhtikothta;
    }

    public void setFormFactor(String megethos) {
        formFactor = megethos;
    }

    public void setConnectivity(String megethos) {
        connectivity = megethos;
    }

    public void setPrice(double poso) {
        price = poso;
    }

    public String getName() {
        return name;
    }

    public int getCapacity() {
        return capacity;
    }

    public String getFormFactor() {
        return formFactor;
    }

    public String getConnectivity() {
        return connectivity;
    }

    public double getPrice() {
        return price;
    }

    public void Function() {
        for (Disk disk : Ds) {
            while (disk.getFormFactor().equals(2.5) && disk.getCapacity() == 250) ;
            System.out.print(disk);
        }
    }

    public void Economic() {
        double min = Ds.get(0).getPrice();
        for (int i = 0; i < Ds.size(); i++) {
            if (Ds.get(i).getPrice() < min) {
                min = Ds.get(i).getPrice();
                System.out.print("The disk with lowest is: " + name + " and the price is: " + price);
            }

        }
    }
}

