public class Rectangle extends Shape {


    private final int width;
    private final int height;

    public Rectangle(int width, int height) {
        this.width = width;
        this.height = height;
    }


    @Override
    public float getLength() {
        return (float) 2 * (width + height);
    }

    @Override
    public float getArea() {
        return (float) width * height;
    }


}