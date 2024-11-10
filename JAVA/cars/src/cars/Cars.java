

package cars;
import java.util.Scanner;
public class Cars {
    public static void main(String[] args) {
       double timi=1.538;
       double mo=6.5/100;
       Scanner apostasi=new Scanner(System.in);
       double km, max=0;
       double euro;
       double sun_t=0;
       double sun_ap=0;
        do{
            System.out.println("parakalw eisagete ta km pou dienisan ta aftokinita:");
            km=apostasi.nextDouble();
            while(km<0){
                System.out.println("h timi aporriptetai");
                System.out.println("eisagetai mia alli timi");
                km=apostasi.nextDouble();
            }
            if(max<km)
            {
                max=km;
            }
            sun_ap=sun_ap + km;
            euro=mo*timi*km;
            sun_t=sun_t+ euro;
    }while(km!=0);
        System.out.printf("to sunoliko kostos einai: %f euro!\n", sun_t);
        System.out.printf("h sunoliki apostasi pou dianisate einai: %f km!\n", sun_ap);
        System.out.printf("h megaluteri apostash pou kalupsate einai: %f km!\n", max);

    
}
}
