// 비동기 방식으로 다음의 과제를 각각 Callback, Promise, Async/Await 방식으로 구현합니다.

// 학생 데이터는 본인의 정보를 기준으로 수정합니다. 
// 학생 데이터의 string 출력은 모두 template string을 사용하여 출력해야 합니다.
// 1초 대기하는 함수를 제외한 모든 함수는 에러를 체크하는 구문이 있어야 합니다.
// 그 외 조건은 studentCallback, studentPromise와 같습니다.

//      예제 student.js 파일을 기반으로 한 출력은 다음과 같습니다.
//      제 이름은 홍길동이고, 20살입니다.
//      학번은 202412345이고, 2학년입니다.

// 3. Async/Await 방식 구현
const fs = require('fs');

class Student {
  constructor(name, age, studentId, year) {
    this.name = name;
    this.age = age;
    this.studentId = studentId;
    this.year = year;
  }
}

async function asyncProcess() {
    // 전체 코드 작성
}

asyncProcess();