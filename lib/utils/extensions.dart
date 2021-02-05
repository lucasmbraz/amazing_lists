extension MapExtension<K, V> on Map<K, V> {
  Map<K, V> insertOrUpdate(K key, V value) {
    final newMap = {...this};
    newMap[key] = value;
    return newMap;
  }
}
