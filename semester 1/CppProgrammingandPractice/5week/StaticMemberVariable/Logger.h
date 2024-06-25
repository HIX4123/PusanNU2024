enum LogLever { DEBUG, INFO, WARNING, ERROR };

class Logger {
  // implement your code
 public:
  static void setLogLevel(int level);
  
  static void debug(const std::string& message, const std::string& tag);
  static void info(const std::string& message, const std::string& tag);
  static void warning(const std::string& message, const std::string& tag);
  static void error(const std::string& message, const std::string& tag);

 private:
  static int logLevel;
};