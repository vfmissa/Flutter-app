

// ignore_for_file: file_names
//"CREATE TABLE aroma(id INTEGER PRIMARY KEY AUTOINCREMENT,num_amostra CHAR, aroma CHAR, aroma2 CHAR)";
class ModeloAromatico{

  late int _id;
  late String _Numamostra;
  late String _aroma;
  late String _aroma2;


ModeloAromatico(this._Numamostra,this._aroma,this._aroma2);
ModeloAromatico.withid(this._id,this._Numamostra,this._aroma,this._aroma2);

int get id =>_id;
String get Numamostra => _Numamostra;
String get aroma => _aroma;
  String get aroma2 => _aroma2;

set Numamostra(String newNumamostra){
  this.Numamostra= newNumamostra;

}

  set aroma(String newAroma){
    this.aroma= newAroma;

  }

  set aroma2(String newAroma2){
    this.aroma2= newAroma2;

  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    map["id"] =_id;
    map['num_amostra']=_Numamostra;
    map['aroma']=_aroma;
    map['aroma']=_aroma2;

    return map;

  }

  ModeloAromatico.fromMapObject(Map<String,dynamic>map){
    this._id =map['id'];
    this._Numamostra=map['num_amostra'];
    this._aroma=map['aroma'];
    this._aroma2=map['aroma2'];
  }





}