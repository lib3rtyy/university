package Computer;
import java.util.Scanner;

public class HDD extends Disk
{
    private int RPM;
    private String type="";

    public HDD(String type,String name, int capacity, String formFactor, String connectivity,Double price,int RPM) {
        super(name, capacity, formFactor, connectivity,price);
        this.RPM=RPM;
        this.type=type;
       /* while (!formFactor.equals("3.5") || !formFactor.equals("2.5") ) {
            System.out.print("Please insert again a correct type:  "+"\n");
            super.setFormFactor(formFactor);
        }

        while (!connectivity.equals("SAS") || !connectivity.equals("SATA")) {
            System.out.print("Please insert again a correct type:");
            super.setConnectivity(connectivity);
        }
        */

    }

    public String toString() {
        return "Type:"+type+" " + super.toString()+ " RPM: "+ RPM + "\n";
    }

    public void setRPM(int rpm)
    {
        RPM=rpm;
    }

    public int getRPM()
    {
        return RPM;
    }

}
