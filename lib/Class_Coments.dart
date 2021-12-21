
class Coments {

  int _id;
  String _name;
  String _email;

  Coments(this._id, this._name, this._email);

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

}