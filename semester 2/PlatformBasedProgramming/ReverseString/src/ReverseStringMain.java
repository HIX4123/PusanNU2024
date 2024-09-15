import java.util.Scanner;

public class ReverseStringMain {


    public static void main(String[] args) {
        String string = new Scanner(System.in).nextLine();

        for (int i = string.length() - 1; i >= 0; i--) {
            System.out.print(string.charAt(i));
        }
    }


}