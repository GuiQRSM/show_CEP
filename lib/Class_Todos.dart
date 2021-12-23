
class Todos {

  int _id;
  String _title;
  bool _comp;

  Todos(this._id, this._title, this._comp);

  bool get comp => _comp;

  set comp(bool value) {
    _comp = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}