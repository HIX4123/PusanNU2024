# 컴퓨터구조 요약

## 1장: **컴퓨터 추상화 및 기술**

---

### 1.1 컴퓨터 혁명

- **영역 특화**
  - **자동차**
  - **휴대전화**
  - **인간 게놈 프로젝트**
  - **월드와이드웹**
  - **검색 엔진**

---

### 1.2 컴퓨터 종류

- **개인용 컴퓨터**
- **서버 컴퓨터**
- **슈퍼컴퓨터**:
- **임베디드 컴퓨터**

---

### 1.3 포스트 PC 시대

- **개인 모바일 장치(PMD)**: 배터리로 작동하며 인터넷에 연결된 장치(예: 스마트폰, 태블릿).
- **클라우드 컴퓨팅**:
  - **웨어하우스 스케일 컴퓨터(WSC)**: 클라우드 서비스를 지원하는 대규모 인프라.
  - **서비스형 소프트웨어(SaaS)**: 소프트웨어의 일부는 PMD에서 실행되고 일부는 클라우드(예: Amazon, Google)에서 실행됩니다.

---

### 1.4 학습 내용

- 프로그램이 기계어로 번역되는 방식과 하드웨어가 프로그램을 실행하는 방식 이해
- 주제:
  - **성능 향상**: 프로그램 성능 결정 및 개선
  - **병렬 처리**: 하드웨어 설계자가 성능을 개선하기 위한 핵심.

---

### 1.5 성능 이해

- **성능 요소**:
  - **알고리즘**
  - **프로그래밍 언어, 컴파일러, 아키텍처**: 실행되는 명령어 수에 영향
  - **프로세서 및 메모리 시스템**
  - **입출력 시스템**

---

### 1.6 컴퓨터 아키텍처의 7가지 위대한 아이디어

1. **추상화**
2. **일반적인 케이스를 빠르게 만들기**: 자주 사용하는 부분 최적화
3. **병렬 처리**
4. **파이프라이닝**
5. **예측**
6. **기억의 계층 구조**: 각기 다른 유형의 메모리는 목적에 따라 최적화되어 있음
7. **이중화를 통한 신뢰성**: 구성 요소를 이중화하여 안정성 향상

---

### 1.7 프로그램 구조

- **소프트웨어 스택**:
  - **애플리케이션 소프트웨어**
  - **시스템 소프트웨어**: 컴파일러 + OS
  - **하드웨어**

---

### 1.8 컴퓨터의 구성 요소

- 핵심 구성 요소: **프로세서**, **메모리**, **I/O**.
- **입력/출력 장치**: 사용자 인터페이스(예: 디스플레이, 키보드) 및 스토리지(예: 하드 드라이브, 플래시 드라이브).
- **네트워크 어댑터**

---

### 1.9 터치스크린 및 디스플레이

- **터치스크린**
- **LCD 화면**: 프레임 버퍼 메모리의 콘텐츠 반영

---

### 1.10 프로세서 내부(CPU)

- **데이터패스**: 데이터에 대한 작업을 실행합니다.
- **제어**: 데이터 경로, 메모리 및 기타 구성 요소를 조정합니다.
- **캐시 메모리**: 즉각적인 데이터 액세스를 위한 작고 빠른 메모리.

---

### 1.11 컴퓨팅의 추상화

- 세부 정보를 숨겨 복잡성 관리에 도움
- **인스트럭션 세트 아키텍처(ISA)**: 하드웨어와 소프트웨어 간의 인터페이스 정의
- **애플리케이션 바이너리 인터페이스(ABI)**: ISA와 시스템 소프트웨어 인터페이스 결합

---

### 1.12 메모리 계층 구조

- **휘발성 메모리**(예: RAM)
- **비휘발성 메모리**(예: 자기 디스크, 플래시 메모리)

---

### 1.13 네트워킹

- **네트워크 유형**:
  - **근거리 통신망(LAN)**: 단거리 통신을 위한 이더넷.
  - **광역 네트워크(WAN)**: 장거리 통신을 위한 인터넷.
  - **무선 네트워크**: Wi-Fi, 모바일 통신용 블루투스.

---

### 1.14 기술 트렌드

- **반도체 기술**

---

### 1.15 성능 지표

- **응답 시간**: 작업을 완료하는 데 걸린 시간입니다.
- **처리량**: 시간 단위당 완료된 작업의 양입니다.

---

### 1.16 실행 시간 측정

- **CPU 시간**: 클럭 속도와 클럭 사이클 수에 영향을 받는 작업 처리 시간입니다.
- **명령어 수**: 실행된 명령어 수로, 프로그램, ISA 및 컴파일러의 영향을 받습니다.

---

### 1.17 CPU 성능

- **클럭킹**: 디지털 하드웨어의 작동은 클럭 주기에 의해 제어됩니다.
- **CPI(명령어당 사이클)**: 각 명령어에 필요한 클럭 사이클 수를 측정한 값입니다.

---

### 1.18 전력 및 에너지 고려 사항

- **전력 트렌드**: CMOS 기술은 전압과 주파수가 핵심 요소인 전력 소비를 관리합니다.
- **전력 절감**: 용량성 부하 또는 클록 주파수를 낮추는 등의 기술로 전력 사용량을 줄일 수 있지만 '전력 벽'으로 인해 추가 개선이 제한됩니다.

---

### 1.19 멀티프로세싱으로의 전환

- **멀티프로세서**: 단일 칩에 여러 개의 코어를 탑재하는 것이 표준이 되고 있습니다. 최적의 성능을 위해 병렬 프로그래밍과 로드 밸런싱이 필요합니다.

---

### 1.20 성능 벤치마크

- **SPEC 벤치마크**: 실제 애플리케이션을 대표하는 워크로드로 CPU 성능을 평가하는 데 사용됩니다.
