import java.util.ArrayList;
import java.util.Scanner;

public class SwitchMain {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<String> months = new ArrayList<>();
        while (true) {
            String cmd = scanner.next().toLowerCase();

            switch (cmd) {
                case "add" -> {
                    int monthNum = scanner.nextInt();
                    String month = switch (monthNum) {
                        case 1 -> "January";
                        case 2 -> "February";
                        case 3 -> "March";
                        case 4 -> "April";
                        case 5 -> "May";
                        case 6 -> "June";
                        case 7 -> "July";
                        case 8 -> "August";
                        case 9 -> "September";
                        case 10 -> "October";
                        case 11 -> "November";
                        case 12 -> "December";
                        default -> {
                            System.err.printf("Wrong input! Expected numbers in [1~12], but the input is %d!\n",
                                    monthNum);
                            yield null;
                        }
                    };
                    if (month != null) {
                        months.add(month);
                    }
                }
                case "print" -> System.out.println(months);
                case "quit" -> {
                    System.out.println("Bye");
                    return;
                }
                default -> System.out.println("Invalid Command");
            }
        }
    }


}