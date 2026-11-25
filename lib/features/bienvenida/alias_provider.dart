import 'package:flutter_riverpod/flutter_riverpod.dart';

class AliasNotifier extends Notifier<String> {
  @override
  String build() => '';

  void guardar(String alias) => state = alias;
}

final aliasProvider = NotifierProvider<AliasNotifier, String>(
  AliasNotifier.new,
);