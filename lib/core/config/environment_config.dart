class EnvironmentConfig {
  static String apiUrl = 'https://api-url.com/';

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        apiUrl = 'https://dev.api-url.com/';
        break;
      case Environment.homolog:
        apiUrl = 'https://hom.api-url.com/';
        break;
      case Environment.prod:
        apiUrl = 'https://api-url.com/';
        break;
    }
  }
}

enum Environment { dev, homolog, prod }
