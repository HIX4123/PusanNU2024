import java.util.Objects;

public class Person {


    private String name;
    private int age;
    private String hometown;

    public Person(String name, int age, String hometown) {
        this.name = name;
        this.age = age;
        this.hometown = hometown;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || this.getClass() != o.getClass()) {
            return false;
        }
        Person person = (Person) o;
        return name.equals(person.name) && age == person.age && hometown.equals(person.hometown);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age, hometown);
    }


}