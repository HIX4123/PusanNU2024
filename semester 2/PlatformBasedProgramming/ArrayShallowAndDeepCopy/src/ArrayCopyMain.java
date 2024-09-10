import java.util.Arrays;
import java.util.Scanner;

public class ArrayCopyMain {


    private static void modifyArray(int[] array, int index) {
        array[index] = 15;
    }

    public static void main(String[] args) {
        //입력으로부터 배열을 생성하시오
        Scanner scanner = new Scanner(System.in);

        int length = scanner.nextInt();
        int[] original = new int[length];
        for (int i = 0; i < length; i++) {
            original[i] = scanner.nextInt();
        }

        //shallow copy 수행 코드를 작성하시오
        int[] shallow = original;
        modifyArray(shallow, 1);
        System.out.println("Shallow Copy: " + Arrays.toString(original));

        //deep copy 수행 코드를 작성하시오
        int[] deep = Arrays.copyOf(original, original.length);
        modifyArray(deep, 2);
        System.out.println("Deep Copy: " + Arrays.toString(original));
    }


}