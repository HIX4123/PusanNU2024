import java.util.ArrayList;
import java.util.Scanner;

record Triangle(int base, int height) {


    public double getArea() {
        return (double) base * height / 2;
    }

    @Override
    public String toString() {
        return String.format("%s [base=%d, height=%d, area=%.02f]", getClass().getName(), base, height, getArea());
    }


}


public class TriangleTest {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();

        ArrayList<Triangle> triangles = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            triangles.add(new Triangle(scanner.nextInt(), scanner.nextInt()));
        }

        for (Triangle triangle : triangles) {
            System.out.println(triangle);
        }
    }


}