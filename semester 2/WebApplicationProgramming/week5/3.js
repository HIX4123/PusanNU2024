const myMap = new Map();
myMap.set('myName', '권민규');
myMap.set('myStudentId', '202355517');
myMap.set('Apple', 'is not a banana');
myMap.delete('myStudentId');

console.log(myMap.size); // 결과: 2
console.log(myMap.has('apple')); // 결과: false