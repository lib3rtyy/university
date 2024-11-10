package Caesar;
import java.util.Scanner;

public class JuliusCaesar extends CaesarCrypto  {
    private  int[] shift=new int[10];

    public JuliusCaesar(int key, int[] shift)
    {
        super(key);
        this.shift=shift;
    }

    public JuliusCaesar()
    {
        super();

    }


   public String encrypt(String phrase) {
        Scanner sc = new Scanner(System.in);
        System.out.println(" Input the plaintext message : ");
        String text = sc.nextLine();
        System.out.println(" Enter the  shift value : ");
        int[] shift = new int[10];
        int k;
        for(k=0;k<shift.length;k++)
        {
            shift[k]=sc.nextInt();
        }
        System.out.println(" Enter the key value : ");
        int key=sc.nextInt();
        String ciphertext = "";
        char alphabet;
        for (int i = 0; i <text.length(); i++) {
            alphabet = text.charAt(i);
            if (alphabet >= 'a' && alphabet <= 'z')
            {
                alphabet = (char) (alphabet  + key);
                if (alphabet > 'z')
                {
                    alphabet = (char) (alphabet + 'a' - 'z' - 1);
                }
                text = text + alphabet;
            }
            else if (alphabet >= 'A' && alphabet <= 'Z') {
                alphabet = (char) (alphabet+key);
                if (alphabet > 'Z')
                {
                    alphabet = (char) (alphabet + 'A' - 'Z' - 1);
                }
                text = text + alphabet;
            } else {
                text = text + alphabet;
            }
            for(i=0;i<ciphertext.length();i++)
            {
                alphabet = ciphertext.charAt(i);
                if (alphabet >= 'a' && alphabet <= 'z')
                {
                    alphabet = (char) (alphabet  + shift[i]);
                    if (alphabet > 'z')
                    {
                        alphabet = (char) (alphabet + 'a' - 'z' - 1);
                    }
                   ciphertext = ciphertext + alphabet;
                }
                else if (alphabet >= 'A' && alphabet <= 'Z') {
                    alphabet = (char) (alphabet + shift[i]);
                    if (alphabet > 'Z')
                    {
                        alphabet = (char) (alphabet + 'A' - 'Z' - 1);
                    }
                    ciphertext = ciphertext + alphabet;
                } else {
                    ciphertext = ciphertext + alphabet;
                }
            }
            System.out.println("Ciphertext : " + ciphertext);
        }
        return ciphertext;
    }


    @Override
    public String decrypt(String phrase) {
        Scanner sc = new Scanner(System.in);
        System.out.println(" Input the ciphertext message : ");
        String ciphertext = sc.nextLine();
        System.out.println(" Enter the shift value : ");
        int[] shift = new int[10];
        int k;
        for(k=0;k<shift.length;k++)
        {
            shift[k]=sc.nextInt();
        }
        System.out.println(" Enter the key value : ");
        int key=sc.nextInt();
        String decryptMessage = "";
        for(int i=0; i < ciphertext.length();i++)
        {
            char alphabet = ciphertext.charAt(i);
            if(alphabet >= 'a' && alphabet <= 'z')
            {
                alphabet = (char) (alphabet -key);
                if(alphabet < 'a')
                {
                    alphabet = (char) (alphabet-'a'+'z'+1);
                }
                decryptMessage = decryptMessage + alphabet;
            }
            else if(alphabet >= 'A' && alphabet <= 'Z')
            {
                alphabet = (char) (alphabet - key);
                if (alphabet < 'A')
                {
                    alphabet = (char) (alphabet-'A'+'Z'+1);
                }
                decryptMessage = decryptMessage + alphabet;
            }
            else
            {
                decryptMessage = decryptMessage + alphabet;
            }
            for (i=0;i<decryptMessage.length();i++)
            {
                if(alphabet >= 'a' && alphabet <= 'z')
                {
                    alphabet = (char) (alphabet - shift[i]);
                    if(alphabet < 'a')
                    {
                        alphabet = (char) (alphabet-'a'+'z'+1);
                    }
                    decryptMessage = decryptMessage + alphabet;
                }
                else if(alphabet >= 'A' && alphabet <= 'Z')
                {
                    alphabet = (char) (alphabet - shift[i]);
                    if (alphabet < 'A')
                    {
                        alphabet = (char) (alphabet-'A'+'Z'+1);
                    }
                    decryptMessage = decryptMessage + alphabet;
                }
                else
                {
                    decryptMessage = decryptMessage + alphabet;
                }
            }
        }
        System.out.println("Decrypt message : " + decryptMessage);
        return decryptMessage;
    }

    @Override
    public void print() {
        System.out.println("JuliusCaesar"+ new JuliusCaesar());
    }

    public String toString()
    {
        return super.toString() +" Shift: "+ shift+"\n";
    }
}
