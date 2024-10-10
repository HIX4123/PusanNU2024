public class Triangle extends Shape {


    private final int side1;
    private final int side2;
    private final int side3;

    public Triangle(int side1, int side2, int side3) {
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }


    @Override
    public float getLength() {
        return (float) side1 + side2 + side3;
    }

    @Override
    public float getArea() {
        double semiperimeter = (float) (side1 + side2 + side3) / 2;
        return (float) Math.sqrt(semiperimeter * (semiperimeter - side1) * (semiperimeter - side2) * (semiperimeter - side3));
    }


}