public class Professor extends Person {


    String schoolName;
    String major;


    public Professor(String name, int age, String hometown, String schoolName, String major) {
        super(name, age, hometown);
        this.schoolName = schoolName;
        this.major = major;
    }

    public String schoolName() {
        return schoolName   ;
    }

    public String major() {
        return major;
    }


}