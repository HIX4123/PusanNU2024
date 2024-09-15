import java.util.Scanner;

public class RowColumnMain {


    public static void main(String[] args) {
        System.out.print("Enter two numbers: ");
        Scanner scanner = new Scanner(System.in);
        int row = scanner.nextInt();
        int column = scanner.nextInt();

        for (int i = 0; i < row; i++) {
            for (int j = 1; j < column; j++) {
                System.out.print(String.format("%d, ", i * column + j));
            }
            System.out.println((i + 1) * column);
        }
    }


}   