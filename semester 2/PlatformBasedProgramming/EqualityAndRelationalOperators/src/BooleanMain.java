import java.util.Scanner;

public class BooleanMain {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int num1 = scanner.nextInt();
        int num2 = scanner.nextInt();
        scanner.close();

        System.out.println("Number1 : " + num1 + " Number2 : " + num2);
        System.out.println("Number1 > Number2 ? " + (num1 > num2 ? "true" : "false"));
        System.out.println("Number1 < Number2 ? " + (num1 < num2 ? "true" : "false"));
        System.out.println("Number1 == Number2 ? " + (num1 == num2 ? "true" : "false"));
    }


}