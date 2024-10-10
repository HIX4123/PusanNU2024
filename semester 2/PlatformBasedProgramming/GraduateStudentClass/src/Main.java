public class Main {


    public static void main(String[] args) {
        // Create an array of Student objects
        Student[] students = new Student[3];

        // Add Student and GraduateStudent objects
        students[0] = new Student("S001", "Alice", "alice@example.com");
        students[1] = new GraduateStudent("GS001", "Bob", "bob@example.com", "A Study on Machine Learning");
        students[2] = new GraduateStudent("GS002", "Charlie", "charlie@example.com", "Deep Learning Applications");

        // Use polymorphism to call toString() on each object
        for (Student student : students) {
            System.out.println(student.toString());
        }
    }


}