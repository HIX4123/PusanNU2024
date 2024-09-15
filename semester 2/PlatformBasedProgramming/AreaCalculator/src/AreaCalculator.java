import java.util.Scanner;

public class AreaCalculator {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        enum Shape {
            TRIANGLE, RECTANGLE, CIRCLE
        }
        ;
        while (true) {
            String cmd = scanner.next().toUpperCase();
            boolean quitIsActivated = false;

            switch (cmd) {
                case "TRIANGLE" -> {
                    double base = scanner.nextDouble();
                    double height = scanner.nextDouble();
                    System.out.printf("Area of Triangle: %.2f\n", base * height / 2);
                }
                case "RECTANGLE" -> {
                    double width = scanner.nextDouble();
                    double height = scanner.nextDouble();
                    System.out.printf("Area of Rectangle: %.2f\n", width * height);
                }
                case "CIRCLE" -> {
                    double radius = scanner.nextDouble();
                    System.out.printf("Area of Circle: %.2f\n", radius * radius * Math.PI);
                }
                case "QUIT" -> {
                    System.out.println("Bye");
                    quitIsActivated = true;
                }
                default -> System.out.println("INVALID");
            }

            if (quitIsActivated)
                break;
        }

    }


}