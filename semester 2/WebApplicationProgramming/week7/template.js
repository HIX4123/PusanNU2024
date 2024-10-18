const fs = require("fs").promises;
const fs2 = require("fs");
const readline = require("readline");

const userDataFile = "users.json"; // 사용자 정보를 저장할 파일 경로

// commandline에서 입력받기 위한 모듈. 아래에서 상세 설명
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

/*
요구조건
  1. 사용자 정보는 다음과 같은 형식으로 저장된다.
    - 이름
    - 이메일 주소
    - user.json 파일로 저장
  2. 실행 시 '1. 사용자 정보 읽기' '2. 사용자 추가' 를 출력 후 '선택하려는 번호를 입력하세요 (또는 "q"를 입력하여 종료): ' 를 출력한다.
    - 이 때 1, 2, q가 아닌 다른 입력을 받을 시 '잘못된 선택입니다. 다시 선택해주세요.'를 출력한다.
  3. 1을 입력 시 '사용자 정보 읽기...'를 출력 후 사용자 목록을 출력한다.
    - 이 때 파일이 없거나 빈 파일일 경우 '사용자가 없습니다.'를 출력한다.
    - 아니라면 사용자 목록을 출력한다.
      - 형식: '(사용자 번호). (이름) ((메일주소))'
      ex) 3001. Nylon Musk (nylon@mars.go)
  4. 2를 입력 시 새 사용자를 입력받는다. 
    순차적으로 '새 사용자의 이름을 입력하세요 : '를 출력 후 이름을 입력받고,
    '새 사용자의 이메일을 입력하세요: '를 출력 후 이메일을 입력받는다.
    - 정상적으로 추가되었다면, '새 사용자가 추가되었습니다.'를 출력한다.
    - 이 때 이름 또는 이메일 주소가 중복될 경우 '이름 : (입력한이름) 또는 이메일 : (입력한이메일) 이 중복됩니다.'를 Error로 출력하고 프로그램을 종료한다.
  5. q를 입력 시 '프로그램을 종료합니다.' 출력 후 프로그램을 종료한다.
*/

// 주어진 시간(ms)만큼 대기하는 Promise
// setTimeout 및 Promise 활용
const delay = (ms) => {
  /* To do */
  // 대기 후 완료하는 promise를 반환
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
};

// 비동기 함수로 사용자 정보를 json 파일로부터 불러오기
// 프로미스 체이닝 및 캐치 추가
// JSON.parse를 이용하여 데이터 불러오기
function readUserData() {
  return fs
    .readFile(userDataFile, "utf8")
    .then((data) => {
      users = JSON.parse(data || "[]");
      if (users.length === 0) {
        console.log("사용자가 없습니다.");
        return;
      } else {
        return data;
      }
    })
    .catch((error) => {
      if (error.code === "ENOENT") {
        console.log("사용자가 없습니다.");
      }
    });
}

// 사용자 정보 저장 (완성되어 있는 함수이므로 수정 불필요)
function saveUserData(users) {
  return new Promise((resolve, reject) => {
    fs2.writeFile(
      userDataFile,
      JSON.stringify(users, null, 2),
      "utf8",
      (error) => {
        if (error) {
          reject(error);
        } else {
          resolve();
        }
      }
    );
  });
}

// 비동기 함수로 사용자 추가
/* Todo */ function addUser(user) {
  // 반드시 promise chaining을 사용하여 구현할 것
  // 사용자 정보 읽기
  // 입력된 사용자 중복 검사(이름, 이메일 중 어떤 것이라도 중복되면 등록 불가)
  // 중복 시 에러 발생시키기
  // 새 사용자 추가
  // 사용자 정보 저장
  return readUserData().then((data) => {
    const users = JSON.parse(data || "[]");
    const duplicate = users.some(
      (u) => u.name === user.name || u.email === user.email
    );
    if (duplicate) {
      throw new Error(
        `이름 : ${user.name} 또는 이메일 : ${user.email} 이 중복됩니다.`
      );
    }
    users.push(user);
    return saveUserData(users);
  });
}

// 비동기 함수로 사용자 목록 출력
/* Todo */ function listUsers() {
  // 사용자 정보 읽기 및 출력(비동기)
  // 사용자가 없을 시에 대한 처리
  // 사용자가 존재한다면 사용자 목록 출력
  /* Todo */
  console.log("사용자 정보 읽기...");
  return readUserData().then((data) => {
    if (data === undefined) {
      return;
    }
    const users = JSON.parse(data);
    users.forEach((user, index) => {
      console.log(`${index + 3001}. ${user.name} (${user.email})`);
    });
  });
}

// 비동기 함수로 사용자 관리
/* Todo */ async function main() {
  while (true) {
    console.log("\n1. 사용자 정보 읽기");
    console.log("2. 사용자 추가");

    const choice = /* Todo */ await new Promise((/* Todo */ resolve) => {
      /*
      콘솔에서 사용자의 입력을 받으려면, 다음 구문을 이용
      rl.question(string, callback);
      상세: https://nodejs.org/api/readline.html#rlquestionquery-options-callback
      자세한 예제는 상세 링크 확인
      */
      rl.question(
        '선택하려는 번호를 입력하세요 (또는 "q"를 입력하여 종료): ' /* Todo */,
        (answer) => {
          resolve(answer);
        }
      );
    });

    /* Todo */
    /*
    1번 입력 시
    사용자 목록 출력

    2번 입력 시
    사용자명 입력받기
    사용자 이메일 입력받기

    사용자 추가 시도하기
    딜레이 2초 주기(promise chaining 사용)
    완료 시 사용자 추가 완료 알림(promise chaining 사용)

    addUser 기능 구현 시, promise chaining(then)을 이용하여 작성

    프로그램 종료하려면, 다음 구문을 이용
    rl.close();
    상세: https://nodejs.org/api/readline.html#rlclose
    */
    if (choice === "1") {
      await listUsers();
    } else if (choice === "2") {
      const user = {};
      await new Promise((resolve) => {
        rl.question("새 사용자의 이름을 입력하세요 : ", (name) => {
          user.name = name;
          resolve();
        });
      });
      await new Promise((resolve) => {
        rl.question("새 사용자의 이메일을 입력하세요 : ", (email) => {
          user.email = email;
          resolve();
        });
      });

      try {
        await addUser(user);
        console.log("새 사용자가 추가되었습니다.");
        await delay(1000);
      } catch (error) {
        console.error(error);
        rl.close();
        break;
      }
    } else if (choice === "q") {
      console.log("프로그램을 종료합니다.");
      rl.close();
      break;
    } else {
      console.log("잘못된 선택입니다. 다시 선택해주세요.");
    }
  }
}

main();
