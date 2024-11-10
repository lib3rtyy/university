package Computer;
import java.util.Scanner;

public class SSD extends Disk
{
    private int MTBF;
    public SSD ( String name, int capacity, String formFactor, String connectivity,Double price,int MTBF ) {
        super(name, capacity, formFactor, connectivity,price);
        this.MTBF=MTBF;

        /*
        while (!formFactor.equals("M.2") || !formFactor.equals("2.5") ) {
            System.out.print("Please insert again a correct type:");
            super.setFormFactor(formFactor);
        }
        while (!connectivity.equals("NVMe") || !connectivity.equals("SATA")) {
            System.out.print("Please insert again a correct type:");
            super.setConnectivity(connectivity);
        }
         */
    }

    public String toString()
    {
        return super.toString()+ " MTBF: " +MTBF+"\n";
    }

    public void setMTBF(int mtbf)
    {
        MTBF=mtbf;
    }

    public int getMTBF()
    {
        return MTBF;
    }

}
