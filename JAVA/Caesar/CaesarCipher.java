package Caesar;

public abstract class CaesarCipher implements Payable
{
    private int key;
    public CaesarCipher(int key)
    {
        this.key=key;
    }

    public CaesarCipher()
    {
      key=0;
    }

    abstract String encrypt(String phrase);
    abstract String decrypt(String phrase);
  ;
    public String toString()
    {
        return "Key: "+key +"\n";

    }
}
