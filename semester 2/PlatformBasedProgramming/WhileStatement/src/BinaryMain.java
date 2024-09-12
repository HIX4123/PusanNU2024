import java.util.Scanner;

public class BinaryMain {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int decim = scanner.nextInt();

        StringBuilder stringBuilder = new StringBuilder("Number ").append(decim).append(" in Binary Number: ");
        StringBuilder binaryDigits = new StringBuilder();

        while (decim > 0) {
            binaryDigits.append(decim % 2);
            decim /= 2;
        }

        stringBuilder.append(binaryDigits.reverse());
        System.out.println(stringBuilder);
    }


}