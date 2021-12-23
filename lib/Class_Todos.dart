
class Todos {

  int _id;
  String _title;
  String _comp;

  Todos(this._id, this._title, this._comp);

  String get comp => _comp;

  set comp(String value) {
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