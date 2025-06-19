enum ConnectionStatus { connected, disconnected }

extension ApiClientMethodExt on ConnectionStatus {
  String get value {
    switch (this) {
      case ConnectionStatus.connected:
        return 'Connected';
      case ConnectionStatus.disconnected:
        return 'Disconnected';
    }
  }
}
