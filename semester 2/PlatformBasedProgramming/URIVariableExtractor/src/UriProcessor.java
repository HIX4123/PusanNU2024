import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class UriProcessor {


    private final Map<String, String> patternMappings;

    public UriProcessor(Map<String, String> patternMappings) {
        this.patternMappings = patternMappings;
    }

    public List<String> extractVariableNames(String get, String path) {
        Pattern pattern = Pattern.compile(patternMappings);
    }

    public List<String> extractVariableValues(String get, String path) {

    }


}