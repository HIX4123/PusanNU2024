public class GraduateStudent extends Student {


    final private String thesisTitle;

    public GraduateStudent(String id, String name, String email, String thesisTitle) {
        super(id, name, email);
        this.thesisTitle = thesisTitle;
    }

    @Override
    public String toString() {
        return super.toString() + ", Thesis Title: " + thesisTitle;
    }


}