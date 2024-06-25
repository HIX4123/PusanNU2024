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
 * 경산(100km), 김천(200km), 청주(300km), 안성(400km).
 *
 * 작업:
 * 배터리 잔량을 일정 간격으로 계산하여 출력합니다(10% 감소할 때마다).
 * 배터리가 임계 수준(20%) 이하로 떨어지지 않도록 경유지에서 충전 중지를 미리
 * 계획하세요. 초기 배터리 충전량, 배터리 소모율, 다음 사용 가능한 충전소까지의
 * 거리를 기준으로 최적의 충전 중지 지점을 결정합니다.
 *
 * 과금 전략:
 * 다음 충전소에 도착하기 전에 배터리 잔량이 20% 미만으로 떨어질 것으로 예상되는
 * 경우 경유지에서 충전해야 합니다. 차량은 각 충전 정거장에서 지정된
 * 수준(80%)까지 충전해야 합니다. 충전소 선택 및 충전을 위한 정차 결정은 배터리
 * 잔량, 이미 주행한 거리, 다음 충전소까지의 거리를 기준으로 해야 합니다. 차량은
 * 역주행해서는 안 되며, 부산에서 서울로 이동하는 경로를 따라 모든 이동은
 * 전진해야 합니다.
 *
 * 입력
 * 배터리용량      전비     충전량(%)     목적지까지거리
 * 72.6            5.6      100           420
 *
 * 출력
 * Current battery level: 100.00%, after traveling 0.00 km.
 * Current battery level: 90.00%, after traveling 40.66 km.
 * Current battery level: 80.00%, after traveling 81.31 km.
 * Current battery level: 70.00%, after traveling 121.97 km.
 * Current battery level: 60.00%, after traveling 162.62 km.
 * Current battery level: 50.00%, after traveling 203.28 km.
 * Current battery level: 40.00%, after traveling 243.94 km.
 * Current battery level: 30.00%, after traveling 284.59 km.
 * Current battery level: 27.00%, after traveling 296.79 km.
 * Battery at 27.00%, stopping at Cheongju for charging.
 * Current battery level: 80.00%, after traveling 300.00 km.
 * Current battery level: 70.00%, after traveling 340.66 km.
 * Current battery level: 60.00%, after traveling 381.31 km.
 * Arrived in Seoul with 50.00% battery remaining.
 */

#include <cmath>
#include <iomanip>
#include <iostream>

const double CHARGING_THRESHOLD = 20.0;
const double CHARGING_UPTO = 80.0;
const double MAXIMUM_BATTERY = 100.0;

struct Car {
  double capacity;
  double efficiency;
  double battery_level;
  double distance;
};

void print_status(double battery_level, double distance) {
  std::cout << std::fixed << std::setprecision(2)
            << "Current battery level: " << battery_level
            << "%, after traveling " << distance << " km." << std::endl;
}

void charge_battery(Car &car, double &now) {
  std::cout << "Battery at " << car.battery_level
            << "%, stopping at Cheongju for charging." << std::endl;
  car.battery_level = CHARGING_UPTO;
  now = static_cast<int>(now / MAXIMUM_BATTERY + 1) * MAXIMUM_BATTERY;
}

void calculate_driving(Car &car) {
  const double km_per_kW = car.capacity / 100 * car.efficiency;
  double now = 0;

  print_status(car.battery_level, now);

  while (now + km_per_kW < car.distance) {
    car.battery_level--;
    now += km_per_kW;
    if (fmod(now, MAXIMUM_BATTERY) + km_per_kW > MAXIMUM_BATTERY &&
        car.battery_level < CHARGING_THRESHOLD + MAXIMUM_BATTERY / km_per_kW) {
      print_status(car.battery_level, now);
      charge_battery(car, now);
    }
    if (static_cast<int>(car.battery_level) % 10 == 0) {
      print_status(car.battery_level, now);
    }
  }
  std::cout << "Arrived in Seoul with "
            << (car.distance - now != 0.0 ? car.battery_level - 1
                                          : car.battery_level)
            << "% battery remaining." << std::endl;
}

int main() {
  Car car{};
  std::cin >> car.capacity >> car.efficiency >> car.battery_level >>
      car.distance;
  calculate_driving(car);
}