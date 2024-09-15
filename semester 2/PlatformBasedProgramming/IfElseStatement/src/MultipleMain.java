import java.util.Scanner;

public class MultipleMain {


    public static void main(String[] args) {
        int num = new Scanner(System.in).nextInt();

        if (num % 2 != 0 && num % 3 != 0) {
            System.out.printf("%d is not a multiple of 2 and 3\n", num);
            return;
        }
        System.out.printf("%d is a multiple of ", num);
        if (num % 6 == 0) {
            System.out.println("2 and 3");
        } else if (num % 3 == 0) {
            System.out.println(3);
        } else {
            System.out.println(2);
        }
    }


}