/*
 * implement your code
 * static 멤버 변수를 정의하고 초기값을 1로 설정합니다.
 * 멤버 함수를 구현
 */

#include <iostream>
#include <string>

enum LogLevel { DEBUG, INFO, WARNING, ERROR };

class Logger {
 public:
  static void setLogLevel(int level) { logLevel = level; };

  static void debug(const std::string& message, const std::string& tag);
  static void info(const std::string& message, const std::string& tag);
  static void warning(const std::string& message, const std::string& tag);
  static void error(const std::string& message, const std::string& tag);

 private:
  static int logLevel;
};

// void Logger::setLogLevel(int level) { logLevel = level; }

void Logger::debug(const std::string& message, const std::string& tag) {
  if (logLevel <= DEBUG) {
    std::cout << "[DEBUG] [" << tag << "] " << message << std::endl;
  }
}
void Logger::info(const std::string& message, const std::string& tag) {
  if (logLevel <= INFO) {
    std::cout << "[INFO] [" << tag << "] " << message << std::endl;
  }
}
void Logger::warning(const std::string& message, const std::string& tag) {
  if (logLevel <= WARNING) {
    std::cout << "[WARNING] [" << tag << "] " << message << std::endl;
  }
}
void Logger::error(const std::string& message, const std::string& tag) {
  if (logLevel <= ERROR) {
    std::cout << "[ERROR] [" << tag << "] " << message << std::endl;
  }
}

int Logger::logLevel = 1;