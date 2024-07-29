class RoomTypesModel {
  bool? state;
  List<String>? data;

  RoomTypesModel({this.state, this.data});

  RoomTypesModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    data = json['data'].cast<String>();
  }

}
