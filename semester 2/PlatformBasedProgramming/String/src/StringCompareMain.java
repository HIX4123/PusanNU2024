import java.util.Scanner;

public class StringCompareMain {


    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);

        String str1 = scanner.nextLine();
        String str2 = scanner.nextLine();

        System.out.println(str1.equals(str2) ? "true" : "false");
        System.out.println(str1.equalsIgnoreCase(str2) ? "true" : "false");
        System.out.println(str1.equals(str2.toLowerCase()) ? "true" : "false");
        System.out.println(str1.replaceAll("easy", "fun").equalsIgnoreCase(str2));
    }


}