import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UriProcessor {


    private final Map<String, String> patternMappings;

    public UriProcessor(Map<String, String> patternMappings) {
        this.patternMappings = patternMappings;
    }

    public List<String> extractVariableNames(String method, String path) {

        List<String> variableNames = new ArrayList<>();

        patternMappings.forEach((key, value) -> {
            Pattern pattern = Pattern.compile("\\{(\\w+)}");
            Matcher matcher = pattern.matcher(key);

            while (matcher.find()) {
                for (int i = 1; i <= matcher.groupCount(); i++) {
                    variableNames.add(matcher.group(i));
                }
            }

        });

        return variableNames;
    }


    public List<String> extractVariableValues(String get, String path) {
        // construct a regex from the URI template that can capture the values corresponding to the placeholders in
        // the actual URI.

        List<String> variableValues = new ArrayList<>();

        if (patternMappings.isEmpty()) {
            return variableValues;
        }

        patternMappings.forEach((key, value) -> {
            Pattern pattern = Pattern.compile(value.split(" ")[1]);
            Matcher matcher = pattern.matcher(path);

            while (matcher.find()) {
                for (int i = 1; i <= matcher.groupCount(); i++) {
                    variableValues.add(matcher.group(i));
                }
            }
        });

        return variableValues;

    }


}