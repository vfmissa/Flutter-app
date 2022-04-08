// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, unnecessary_this

class ModeloDiscriminativo{

  late int _id;
  late int _data;
  late String _provador;
  late String _Numamostra;
  late String _Numamostra2;
  late String _Numamostra3;
  late String _Numamostra4;
  late String _Numamostra5;
  late String _Numamostra6;
  late String _Numamostra7;
  late String _Numamostra8;
  late String _Numamostra9;
  late String _caracteristica;
  late String _comentario;

  ModeloDiscriminativo(this._data,this._provador,this._Numamostra,this._Numamostra2,this._Numamostra3,
      this._Numamostra4,this._Numamostra5,this._Numamostra6,this._Numamostra7,this._Numamostra8,this._Numamostra9,this._caracteristica,this._comentario);

  int get id =>_id;
  int get data =>_data;
  String get provador =>_provador;
  String get Numamostra => _Numamostra;
  String get Numamostra2 => _Numamostra2;
  String get Numamostra3 => _Numamostra3;
  String get Numamostra4 => _Numamostra4;
  String get Numamostra5 => _Numamostra5;
  String get Numamostra6 => _Numamostra6;
  String get Numamostra7 => _Numamostra7;
  String get Numamostra8 => _Numamostra8;
  String get Numamostra9 => _Numamostra9;
  String get caracteristica => _caracteristica;
  String get comentario =>_comentario;

  set data(int newdata){
    this.data = newdata;
  }
  set provador(String newprovador){
    this.provador= newprovador;

  }
  set Numamostra(String newNumamostra){
    this.Numamostra= newNumamostra;

  }


  set Numamostra2(String newNumamostra2) {
    this.Numamostra2 = newNumamostra2;
  }


  set Numamostra3(String newNumamostra){
    this.Numamostra3= newNumamostra;

  }


  set Numamostra4(String newNumamostra){
    this.Numamostra4= newNumamostra;

  }

  set Numamostra5(String newNumamostra){
    this.Numamostra5= newNumamostra;

  }

  set Numamostra6(String newNumamostra){
    this.Numamostra6= newNumamostra;

  }

  set Numamostra7(String newNumamostra){
    this.Numamostra7= newNumamostra;

  }

  set Numamostra9(String newNumamostra){
    this.Numamostra9= newNumamostra;

  }

  set caracteristica(String newNumamostra){
    this.caracteristica= newNumamostra;

  }

  set comentario(String newcomentario){
    this._comentario = newcomentario;
  }

//convert to map
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    map["id"] =_id;
    map["data"]=_data;
    map['provador']=_provador;
    map['num_amostra']=_Numamostra;
    map['num_amostra2']=_Numamostra2;
    map['num_amostra3']=_Numamostra3;
    map['num_amostra4']=_Numamostra4;
    map['num_amostra5']=_Numamostra5;
    map['num_amostra6']=_Numamostra6;
    map['num_amostra7']=_Numamostra7;
    map['num_amostra8']=_Numamostra8;
    map['num_amostra9']=_Numamostra9;
    map['caracteristica']=_caracteristica;
    map['comentario']=_comentario;

    return map;

  }

  ModeloDiscriminativo.fromMapObject(Map<String, dynamic> map){
    this._id =map['id'];
    this._data=map['data'];
    this._provador=map['provador'];
    this._Numamostra=map['num_amostra'];
    this._Numamostra2=map['num_amostra2'];
    this._Numamostra3=map['num_amostra3'];
    this._Numamostra4=map['num_amostra4'];
    this._Numamostra5=map['num_amostra5'];
    this._Numamostra6=map['num_amostra6'];
    this._Numamostra7=map['num_amostra7'];
    this._Numamostra8=map['num_amostra8'];
    this._Numamostra9=map['num_amostra9'];
    this._caracteristica=map['caracteristica'];
    this._comentario=map['comentario'];
  }

  Map<String,dynamic>toJson(){
    return{
      "frame1": {
        "campos_fixos": {
          "name": {
            "caption": "PROVADOR",
            "type": "String"
          },
          "date": {
            "type": "DATA",
            "readonly": "true"
          }
        }
      },

    };

  }




}