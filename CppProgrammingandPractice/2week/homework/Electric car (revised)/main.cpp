/*
 * 부산에서 서울까지 전기차를 타고 이동합니다.
 * 우리가 타는 차의 배터리용량은 72.6kWh이고, 시간당 5.6km/kWh의 전력을
 * 소비합니다. 부산과 서울 사이의거리는 420km라고 가정합니다. 전기차를 추가로
 * 충전하지 않으면 서울까지 한 번에 갈 수 없다는 계산이 나옵니다. 따라서
 * 고속도로 휴게소에서 휴식을 취하고 용량의 80%까지 충전하는 계획을 세워야
 * 합니다.
 *
 * 효율적인 배터리 관리와 충전소의 전략적 계획에 초점을 맞춰 전기차를 타고
 * 부산에서 서울까지 여행을 계획해 보세요. 충전소가 있는 이용 가능한 웨이포인트:
 * 경산(100km), 김천(200km), 청주(300km), 안성(400km).*/
#include <iomanip>
#include <iostream>

int main() {
  float capacity, efficiency, battery_level, distance;
  std::cin >> capacity >> efficiency >> battery_level >> distance;

  const double km_per_kW = capacity / 100 * efficiency;
  double now = 0;

  while (now < distance) {
    if (static_cast<int>(battery_level) % 10 == 0) {
      std::cout << std::fixed << std::setprecision(2)
                << "Current battery level: " << battery_level
                << ", after traveling " << now << " km." << std::endl;
    }
    battery_level--;
    now += km_per_kW;
  }
}
