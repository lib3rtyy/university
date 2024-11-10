package Calculator;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Calculator{


    private double total1=0.0;
    private double total2=0.0;
    private char math_operator;


    private JTextField textField1;
    private JRadioButton ONRadioButton;
    private JRadioButton OFFRadioButton;
    private JButton a7Button;
    private JButton button2;
    private JButton ACButton;
    private JButton button4;
    private JButton a8Button;
    private JButton a9Button;
    private JButton button7;
    private JButton a4Button;
    private JButton a5Button;
    private JButton a6Button;
    private JButton button11;
    private JButton a1Button;
    private JButton a2Button;
    private JButton a3Button;
    private JButton button15;
    private JButton a0Button;
    private JButton button16;
    private JButton button17;

    private void getOperator(String btnText){
        math_operator=btnText.charAt(0);
        total1=total1+Double.parseDouble(textField1.getText());
        textField1.setText("");
    }


    public Calculator() {

        a1Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a1ButtonText = textField1.getText() + a1Button.getText();
                textField1.setText(a1ButtonText);
            }
        });

        a2Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a2ButtonText = textField1.getText() + a2Button.getText();
                textField1.setText(a2ButtonText);
            }
        });
        a3Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a3ButtonText = textField1.getText() + a3Button.getText();
                textField1.setText(a3ButtonText);
            }
        });
        a4Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a4ButtonText = textField1.getText() + a4Button.getText();
                textField1.setText(a4ButtonText);
            }
        });
        a5Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a5ButtonText = textField1.getText() + a5Button.getText();
                textField1.setText(a5ButtonText);
            }
        });
        a6Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a6ButtonText = textField1.getText() + a6Button.getText();
                textField1.setText(a6ButtonText);
            }
        });
        a7Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a7ButtonText = textField1.getText() + a7Button.getText();
                textField1.setText(a7ButtonText);
            }
        });
        a8Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a8ButtonText = textField1.getText() + a8Button.getText();
                textField1.setText(a8ButtonText);
            }
        });
        a9Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a9ButtonText = textField1.getText() + a9Button.getText();
                textField1.setText(a9ButtonText);
            }
        });
        a0Button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String a0ButtonText = textField1.getText() + a0Button.getText();
                textField1.setText(a0ButtonText);
            }
        });
        button4.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String button_text = button4.getText();
                getOperator(button_text);
            }
        });
        button17.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                switch ( math_operator ) {
                    case '+':
                        total2 = total1 + Double.parseDouble(textField1.getText( ) );
                        break;
                    case '-':
                        total2 = total1 -Double.parseDouble(textField1.getText( ) );
                        break;
                    case '/':
                        total2 = total1 /Double.parseDouble(textField1.getText( ) );
                        break;
                    case '*':
                        total2 = total1 * Double.parseDouble(textField1.getText( ) );
                        break;
                }
                textField1.setText(Double.toString(total2));
                total1=0;
            }
        });
        ACButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                total2=0;
                textField1.setText("");
            }
        });
        button16.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(textField1.getText().equals("")){
                    textField1.setText("0.");
                }
                else if (textField1.getText().contains(".")){
                    button16.setEnabled(false);
                }
                else{
                    String button16Text=textField1.getText()+button16.getText();
                    textField1.setText(button16Text);
                }
                button16.setEnabled(true);
            }
        });
        button7.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String button_text = button7.getText();
                getOperator(button_text);
            }
        });
        button15.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String button_text = button15.getText();
                getOperator(button_text);
            }
        });
        button11.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String button_text = button11.getText();
                getOperator(button_text);
            }
        });
    }

    public static void main(String[] args) {
        JFrame frame=new JFrame("Calculator");
        frame.setContentPane(new Calculator().textField1);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }
}
