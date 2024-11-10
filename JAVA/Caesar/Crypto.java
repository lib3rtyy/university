package Caesar;

public class Crypto
{
    public static void main(String[] args)
    {
        SimpleText stext = new SimpleText("Welcome to Java");
        CaesarCrypto crypto = new CaesarCrypto(3);
        int A[]={5,4,6,7,8};
        JuliusCaesar juliusCaesar = new JuliusCaesar(2, A);
        System.out.print(stext);
        System.out.print(crypto);
        System.out.print(juliusCaesar);
        crypto.encrypt("Welcome to Java");
        juliusCaesar.encrypt("Welcome to Java");
        //crypto.decrypt(ciphertext);
        //juliusCaesar.decrypt(ciphertext);
    }
}

