import java.util.Scanner;

public class BasicCalculator {


    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int numOfEquations = input.nextInt();

        for (int i = 0; i < numOfEquations; i++) {
            int i1, i2;
            try {
                i1 = Integer.parseInt(input.next());
            } catch (NumberFormatException e) {
                System.out.println("Invalid number format.");
                input.nextLine();
                continue;
            }

            String var2 = input.next();
            if (var2.equals("sqrt")) {
                System.out.println("Result: " + String.format("%.2f", Math.sqrt(i1)));
                continue;
            } else {
                try {
                    i2 = Integer.parseInt(var2);
                } catch (NumberFormatException e) {
                    System.out.println("Invalid number format.");
                    input.nextLine();
                    continue;
                }
            }

            String var3 = input.next();
            input.nextLine();
            try {
                double result = switch (var3) {
                    case "+" -> i1 + i2;
                    case "-" -> i1 - i2;
                    case "*" -> i1 * i2;
                    case "/" -> {
                        if (i2 == 0)
                            throw new ArithmeticException("Division by zero");
                        yield (double) i1 / i2;
                    }
                    case "^" -> Math.pow(i1, i2);
                    case "%" -> i1 % i2;
                    default -> throw new IllegalStateException("Unexpected value: " + var3);
                };
                System.out.println("Result: " + String.format("%.2f", result));
            } catch (IllegalStateException e) {
                System.out.println("Invalid operator.");
            } catch (ArithmeticException e) {
                System.out.println("Division by zero.");
            }


        }
    }


}