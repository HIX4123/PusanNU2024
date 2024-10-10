public class Professor extends Student {


    String departments;


    public Professor(String name, int age, String hometown, String university, String departments) {
        super(name, age, hometown, university);
        this.departments = departments;
    }


}