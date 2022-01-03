class DemoModel{
  String? uid0;
  String? referedsustmail1;

  DemoModel({this.uid0,this.referedsustmail1});

//receiving data from server
  factory DemoModel.fromMap(map){
    return DemoModel(
      uid0: map['uid0'],
      referedsustmail1: map['referedsustmail1'],
      

    );
  }
  //sending data to our server
  Map<String, dynamic> toMap()
  {
    return{
      'uid0':uid0,
      'referedsustmail1':referedsustmail1,
    };
  }

}