public class Student extends Person {


    private String schoolName;

    public Student(String name, int age, String hometown, String schoolName) {
        super(name, age, hometown);
        this.schoolName = schoolName;
    }


    public String getSchoolName() {
        return schoolName;
    }


    public int getGrade() {
        return 1;
    }


}