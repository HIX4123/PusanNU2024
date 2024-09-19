import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

import static java.lang.Math.abs;

public class DateTimeCalculator {


    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        final String PROMPT = "1. Diff\n2. Add/Sub\n3. Week\n4. Exit\nMenu: ";
        DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        while (true) {
            System.out.print(PROMPT);

            int cmd = scanner.nextInt();
            scanner.nextLine();

            switch (cmd) {
                case 1 -> {
                    try {
                        System.out.print("first date (YYYY-MM-DD): ");
                        String firstDateString = scanner.nextLine();
                        System.out.print("second date (YYYY-MM-DD): ");
                        String secondDateString = scanner.nextLine();

                        LocalDate firstDate = LocalDate.parse(firstDateString, dateTimeFormat);
                        LocalDate secondDate = LocalDate.parse(secondDateString, dateTimeFormat);

                        long diffInDays = abs(firstDate.toEpochDay() - secondDate.toEpochDay());
                        System.out.printf("Diff: %d Days\n", diffInDays);
                    } catch (DateTimeParseException e) {
                        System.out.println("Invalid date format.");
                    }
                }
                case 2 -> {
                    try {
                        System.out.print("date (YYYY-MM-DD): ");
                        String dateString = scanner.nextLine();
                        LocalDate date = LocalDate.parse(dateString, dateTimeFormat);

                        System.out.print("days to add/subtract: ");
                        int dateAddition = scanner.nextInt();
                        scanner.nextLine();

                        LocalDate addedDate = date.plusDays(dateAddition);
                        System.out.printf("New Date: %s\n", addedDate);
                    } catch (DateTimeParseException e) {
                        System.out.println("Invalid date format.");
                    }

                }
                case 3 -> {
                    try {
                        System.out.println("date (YYYY-MM-DD): ");
                        String dateString = scanner.nextLine();
                        LocalDate date = LocalDate.parse(dateString, dateTimeFormat);

                        DayOfWeek day = date.getDayOfWeek();
                        System.out.printf("Day of the week: %s\n", day);
                    } catch (DateTimeParseException e) {
                        System.out.println("Invalid date format");
                    }
                }
                case 4 -> {
                    System.out.println("Exiting...");
                    return;
                }
                default -> throw new RuntimeException("Wrong Command Number Input");

            }
        }
    }


}