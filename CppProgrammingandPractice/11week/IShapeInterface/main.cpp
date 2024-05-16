int main() {
  GroupShape root("root");
  auto button1 = Button{};
  root.add(&button1);

  auto sub1 = GroupShape("sub1");
  auto button2 = Button{};
  sub1.add(&button2);
  auto image1 = Image{};
  sub1.add(&image1);
  auto table1 = Table{};
  sub1.ad(&table1);

  root.add(&sub1);
  root.draw();

  return 0;
}