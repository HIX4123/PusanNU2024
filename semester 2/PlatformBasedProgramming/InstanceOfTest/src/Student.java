public class Student extends Person {


    private String university;

    public Student(String name, int age, String hometown, String university) {
        super(name, age, hometown);
        this.university = university;
    }


}