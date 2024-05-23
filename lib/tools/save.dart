class Save
{
  Save(this._state);
  SaveState _state;
  void setState(SaveState state)
  {
    _state = state;
  }
  SaveState getState()
  {
    return _state;
  }
  String getStateinText()
  {
    switch (_state) {
      case SaveState.empty:
        return 'Пусто';
      case SaveState.loading:
        return 'Загружается...';
      case SaveState.saved:
        return 'Сохранено!';
      default:
        return 'Ошибка!';
    }
  }
}
enum SaveState
{
  empty,
  loading,
  saved,
  corrupted,
}