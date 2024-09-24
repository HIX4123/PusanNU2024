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

    public List<String> extractVariableNames(String ignoredMethod, String path) {
        List<String> variableNames = new ArrayList<>();

        Pattern pattern = Pattern.compile("\\{\\w+}");
        Matcher matcher = pattern.matcher(path);
        while (matcher.find()) {
            for (int i = 0; i < matcher.groupCount(); i++) {
                variableNames.add(matcher.group(i));
            }
        }

        return variableNames;
    }

    public List<String> extractVariableValues(String method, String path) {
        List<String> variableValues = new ArrayList<>();

        String pattern = patternMappings.get(method + " " + path);
        if (pattern == null) {
            return variableValues;
        }

        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(path);
        if (m.find()) {
            for (int i = 1; i <= m.groupCount(); i++) {
                variableValues.add(m.group(i));
            }
        }

        return variableValues;
    }


}