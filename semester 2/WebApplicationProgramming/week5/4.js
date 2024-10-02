const mySet = new Set();

mySet.add('myName');
mySet.add('myStudentId');
mySet.add('Apple');
mySet.add('myStudentId');
mySet.add('apple');
mySet.delete('myStudentId');

console.log(mySet.has('myStudentId'));  // 결과: false
console.log(Array.from(mySet)); // 결과: [ 'myName', 'Apple', 'apple' ]