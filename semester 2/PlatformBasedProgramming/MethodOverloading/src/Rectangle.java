public record Rectangle(Point point1, Point point2) {


    public void moveBy(int x, int y) {
        point1().setX(point1().getX() + x);
        point1().setY(point1().getY() + y);
        point2().setX(point2().getX() + x);
        point2().setY(point2().getY() + y);
    }


    public void moveBy(int direction) {
        point1().setX(point1().getX() + direction);
        point1().setY(point1().getY() + direction);
        point2().setX(point2().getX() + direction);
        point2().setY(point2().getY() + direction);
    }

    @Override
    public String toString() {
        return String.format("%s[(%d, %d), (%d, %d)]", getClass().getName(), point1().getX(), point1().getY(),
                point2().getX(), point2().getY());
    }


}