public abstract class Shape {


    public abstract float getLength();


    public abstract float getArea();


    public void draw() {
        System.out.printf("%s, Area: %.02f, Length: %.02f\n", getClass().getName(), getArea(), getLength());
    }


}