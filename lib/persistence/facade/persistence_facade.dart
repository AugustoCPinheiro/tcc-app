abstract class PersistenceFacade<T, K> {
  Future<T> find(K id);

  Future<List<T>> findAll();

  Future<void> save(T record);

  Future<void> saveAll(List<T> records);

  Future<void> update(K id, T record);
}
