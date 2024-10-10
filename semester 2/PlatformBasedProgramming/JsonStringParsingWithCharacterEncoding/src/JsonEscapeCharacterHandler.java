public class JsonEscapeCharacterHandler {


    public String handleEscapedCharacters(String str) {
        StringBuilder result = new StringBuilder();
        boolean isEscaping = false;

        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            // Implement your code
            if (c == '\\') {
                isEscaping = true;
                continue;
            }
            if (isEscaping) {
                switch (c) {
                    case '"' -> result.append('"');
                    case '\\' -> result.append('\\');
                    case '/' -> result.append('/');
                    case 'b' -> result.deleteCharAt(result.length());
                    case 'f' -> result.append('\f');
                    case 'n' -> result.append('\n');
                    case 'r' -> result.append('\r');
                    case 't' -> result.append('\t');
                    case 'u' -> {
                        if (i + 4 < str.length()) {
                            String hex = str.substring(i + 1, i + 5);
                            result.append((char) Integer.parseInt(hex, 16));
                            i += 4; // Skip the next 4 characters
                        }
                    }
                }
                isEscaping = false;
            } else {
                result.append(c);
            }
        }


        return String.valueOf(result);
    }


}