package Caesar;
import java.util.Scanner;

public class CaesarCrypto extends CaesarCipher {

    public CaesarCrypto(int key)
    {
        super(key);
    }

    public CaesarCrypto()
    {

    }

    @Override
    public String encrypt(String phrase)
    {
        Scanner sc = new Scanner(System.in);
        System.out.println(" Input the text message : ");
        String text = sc.nextLine();
        int key = 3;
        String ciphertext = "";
        char alphabet;
        for(int i=0; i < text.length();i++)
        {
            alphabet = text.charAt(i);

            if(alphabet >= 'a' && alphabet <= 'z')
            {
                alphabet = (char) (alphabet + key);
                if(alphabet > 'z')
                {
                    alphabet = (char) (alphabet+'a'-'z'-1);
                }
                ciphertext = ciphertext + alphabet;
            }
            else if(alphabet >= 'A' && alphabet <= 'Z') {
                alphabet = (char) (alphabet + key);
                if(alphabet > 'Z') {
                    alphabet = (char) (alphabet+'A'-'Z'-1);
                }
                ciphertext = ciphertext + alphabet;
            }
            else {
                ciphertext = ciphertext + alphabet;
            }

        }
        System.out.println("Caesar Crypto text : " + ciphertext);
        return ciphertext;
    }

    @Override
    public String decrypt(String phrase) {
        Scanner sc = new Scanner(System.in);
        System.out.println(" Input the ciphertext message : ");
        String ciphertext = sc.nextLine();
        int key = 3;
        String decryptMessage = "";
        for(int i=0; i < ciphertext.length();i++)

        {
            char alphabet = ciphertext.charAt(i);
            if(alphabet >= 'a' && alphabet <= 'z')
            {
                alphabet = (char) (alphabet - key);
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
        }
        System.out.println("Decrypt message : " + decryptMessage);
        return decryptMessage;
    }

    @Override
    public void print()
    {
    }

    public String toString() {
        return super.toString();
    }


}