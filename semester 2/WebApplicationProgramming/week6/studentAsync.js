// 비동기 방식으로 다음의 과제를 각각 Callback, Promise, Async/Await 방식으로 구현합니다.

const { log, error } = require("console")
const { promises } = require("dns")
const { readFile } = require("fs")
const { parse } = require("path")

// 학생 데이터는 본인의 정보를 기준으로 수정합니다.
// 학생 데이터의 string 출력은 모두 template string을 사용하여 출력해야 합니다.
// 1초 대기하는 함수를 제외한 모든 함수는 에러를 체크하는 구문이 있어야 합니다.
// 그 외 조건은 studentCallback, studentPromise와 같습니다.

//      예제 student.js 파일을 기반으로 한 출력은 다음과 같습니다.
//      제 이름은 홍길동이고, 20살입니다.
//      학번은 202412345이고, 2학년입니다.

// 3. Async/Await 방식 구현
const fs = require("fs").promises;

class Student {
  constructor(name, age, studentId, year) { 
    this.name = name;
    this.age = age;
    this.studentId = studentId;
    this.year = year;
  }
}

function waitForSecondPromise() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, 1000);
  });
}

async function readDataFileAsync() {
  try {
    const data = await fs.readFile("student.json", "utf-8");
    return data;
  } catch (err) {
    handleError(err);
    throw err;
  }
}

async function createInstanceFromDataAsync(data) {
  try {
    const studentData = JSON.parse(data);
    return new Student(
      studentData.name,
      studentData.age,
      studentData.studentId,
      studentData.year
    );
  } catch (err) {
    handleError(err);
    throw err;
  }
}

async function handleLowYearAsync(student) {
  console.log("저는 저학년입니다.");
  return student;
}

async function handleHighYearAsync(student) {
  console.log("저는 고학년입니다.");
  return student;
}

async function printStudentDataAsync(student) {
  console.log(`제 이름은 ${student.name}이고, ${student.age}살입니다.`);
  console.log(`학번은 ${student.studentId}이고, ${student.year}학년입니다.`);
}

async function processStudentDataAsync() {
  try {
    await waitForSecondPromise();
    const data = await readDataFileAsync();
    const student = await createInstanceFromDataAsync(data);

    if (student.year <= 2) {
      await handleLowYearAsync(student);
    } else {
      await handleHighYearAsync(student);
    }

    await printStudentDataAsync(student);
  } catch (err) {
    console.error("오류 발생:", err.message);
  }
}

processStudentDataAsync();

function handleError(err) {
  console.error("에러 처리:", err);
}

