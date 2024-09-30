import java.util.Scanner;

public class OverloadingTest {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Rectangle rectangle1 = new Rectangle(new Point(scanner.nextInt(), scanner.nextInt()), new Point(scanner.nextInt(),
                scanner.nextInt()));
        Rectangle rectangle2 = new Rectangle(new Point(scanner.nextInt(), scanner.nextInt()), new Point(scanner.nextInt(),
                scanner.nextInt()));

        rectangle1.moveBy(scanner.nextInt(), scanner.nextInt());
        rectangle2.moveBy(scanner.nextInt());
        scanner.close();

        System.out.println(rectangle1);
        System.out.println(rectangle2);
    }


}