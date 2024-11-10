package Computer;
import java.util.ArrayList;

public class Computer {
    ArrayList <Disk> Ds=new ArrayList<>();

    public static void main(String[] args){
        ArrayList <Disk> Ds=new ArrayList<>();
        HDD d1=new HDD("HDD","WD WD10EZEX Caviar Blue",1024,"3.5","SATA",38.9,7200);
        Ds.add(d1);
        HDD d2=new HDD("HDD","WD WD5000LPCX Blue",500,"2.5","SATA",40.9,5400);
        Ds.add(d2);
        HDD d3=new HDD("HDD","Seagate ST300MM0048 Enterprise",300,"2.5","SAS",135.9,1000000);
        Ds.add(d3);
        HDD d4=new HDD("SSD","Transcend 220S",120,"2.5","SATA",30.2,10000);
        Ds.add(d4);
        HDD d5=new HDD("SSD","WD S120G2G0B",250,"Μ.2","NVMe",30.9,2000000);
        Ds.add(d5);
        HDD d6=new HDD("SSD","Crucial MX500",500,"Μ.2","SATA",81.0,11800000);
        Ds.add(d6);
        SSD s1=new SSD("Transcend 220S",120,"2.5","SATA",30.2,1000000);
        Ds.add(s1);
        SSD s2=new SSD("WD S120G2G0B",250,"Μ.2","NVMe",30.9,2000000);
        Ds.add(s2);
        SSD s3=new SSD("Crucial MX500",500,"Μ.2","SATA",81.0,11800000);
        Ds.add(s3);
        System.out.print(Ds);
        Ds.get(0).Function();
        Ds.get(0).Economic();
    }
}
