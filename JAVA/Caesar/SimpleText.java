package Caesar;

public  class SimpleText implements Payable
{
    private String text;
    public SimpleText(String text)
    {
        this.text=text;
    }

    public String getText()
    {
        return text;
    }
   public String toString()
   {
       return "Text: "+text+"\n";
   }


    @Override
    public void print() {

    }
}
