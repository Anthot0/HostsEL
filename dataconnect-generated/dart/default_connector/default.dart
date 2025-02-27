library default_connector;

import 'dart:convert';

class DefaultConnector {
  static final DefaultConnector instance = DefaultConnector();

  DefaultConnector();

  void connect() {
    print("Connexion simulée sans FirebaseDataConnect.");
  }
}
