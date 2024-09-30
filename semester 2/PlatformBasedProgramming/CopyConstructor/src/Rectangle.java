public class Rectangle {


    //your code here
    Point point1 = null;
    Point point2 = null;


    public Rectangle(Point p1, Point p2) {
        //your code here
        point1 = p1;
        point2 = p2;
    }

    //copy constructor
    public Rectangle(Rectangle rectangle) {
        //your code here
        point1 = new Point(rectangle.point1.getX(), rectangle.point1.getY());
        point2 = new Point(rectangle.point2.getX(), rectangle.point2.getY());
    }

    public void moveBy(int x, int y) {
        //your code here
        point1.setX(point1.getX() + x);
        point1.setY(point1.getY() + y);
        point2.setX(point2.getX() + x);
        point2.setY(point2.getY() + y);
    }

    @Override
    public String toString() {
        //your code here
        return String.format("%s[(%d, %d), (%d, %d)]", getClass().getName(), point1.getX(), point1.getY(),
                point2.getX(), point2.getY());
    }


}