public class Circle extends Shape {


    private final int radius;

    public Circle(int radius) {
        this.radius = radius;
    }


    @Override
    public float getLength() {
        return (float) ((float) 2 * Math.PI * radius);
    }

    @Override
    public float getArea() {
        return (float) Math.PI * radius * radius;
    }


}