abstract class EnvironmentConfig {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '...',
  );

  static const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: '...',
  );

  static const language = String.fromEnvironment(
    'LANGUAGE',
    defaultValue: '...',
  );
}
