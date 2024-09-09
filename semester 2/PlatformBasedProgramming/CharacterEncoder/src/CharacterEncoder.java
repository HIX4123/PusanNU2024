import java.util.Scanner;

public class CharacterMethod {


    /**
     * Shifts a given character by a specified number of positions in the alphabet.
     * If the character is a lowercase letter, it wraps around within the range 'a' to 'z'.
     * If the character is an uppercase letter, it wraps around within the range 'A' to 'Z'.
     * Non-alphabetic characters are returned unchanged.
     *
     * @param c
     *         the character to be shifted
     * @param shift
     *         the number of positions to shift the character
     *
     * @return the shifted character
     */
    private static char shiftChar(char c, int shift) {
        char base = Character.isUpperCase(c) ? 'A' : 'a';
        return (char) ((c - base + shift) % 26 + base);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String string = scanner.nextLine();
        int caesarNumber = scanner.nextInt();

        char[] chars = string.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            chars[i] = shiftChar(chars[i], caesarNumber);
        }
        string = String.valueOf(chars);

        System.out.println(string);
    }


}