

// ignore_for_file: file_names
//"CREATE TABLE aroma(id INTEGER PRIMARY KEY AUTOINCREMENT,num_amostra CHAR, aroma CHAR, aroma2 CHAR)";
class ModeloAromatico{

  late int _id;
  late int _data;
  late int _testes;
  late String _provador;
  late String _Numamostra;
  late String _aroma;
  late String _aroma2;


ModeloAromatico(this._data,this._provador,this._Numamostra,this._aroma,this._aroma2);
ModeloAromatico.withid(this._id,this._Numamostra,this._aroma,this._aroma2);

int get id =>_id;
int get data=>_data;
String get provador =>_provador;
String get Numamostra => _Numamostra;
String get aroma => _aroma;
String get aroma2 => _aroma2;

set data(int newdata){
  this.data = newdata;
}
  set testes(int newtestes){
    this.testes = newtestes;
  }

set provador(String newprovador){
    this.provador= newprovador;

}

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
    map["data"] =_data;
    map["provador"] =_provador;
    map['num_amostra']=_Numamostra;
    map['aroma']=_aroma;
    map['aroma']=_aroma2;

    return map;

  }

  ModeloAromatico.fromMapObject(Map<String,dynamic>map){
    this._id =map['id'];
    this._data=map["data"];
    this._provador=map["provador"];
    this._Numamostra=map['num_amostra'];
    this._aroma=map['aroma'];
    this._aroma2=map['aroma2'];
  }


  Map<String,dynamic>toJson(){
    return{
      "frame1": {
        "campos_fixos": {
          "name": {
            "caption": _provador,
            "type": "String"
          },
          "date": {
            "type": _data,
            "readonly": "true"
          }
        }
      },
      "frame2": {
        "description": "Você está recebendo dez amostras com aromas diferente, identifique cada aroma presente de acordo com o código."
      },
      "frame3": {
        "repeat": "10",
        "description": "Informe o código da amostra e identifique o aroma presente.",
        "sample": {
          "caption": _Numamostra,
          "type": "Interger"
        },
        "arome": {
          "caption": _aroma,
          "type": "String"
        },
        "sample": {
          "caption": null,
          "type": "Interger"
        },
        "arome": {
          "caption": null,
          "type": "String"
        },

      }
    };

  }











}

