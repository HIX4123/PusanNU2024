#include <stdio.h>
#include <stdbool.h>


bool isPrime(int num) {
  if (num <= 1) {
    return false;
  }
  
  for (int i = 2; i * i <= num; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  
  return true;
}

int main() {
  int input;
  printf("Enter a number: ");
  scanf("%d", &input);
  
  int largestPrime = -1;
  for (int i = input; i >= 2; i--) {
    if (isPrime(i)) {
      largestPrime = i;
      break;
    }
  }
  
  if (largestPrime == -1) {
    printf("No prime number found!\n");
  } else {
    printf("Largest prime number less than or equal to %d: %d\n", input, largestPrime);
  }
  
  return 0;
}