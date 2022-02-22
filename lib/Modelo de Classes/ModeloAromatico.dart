

// ignore_for_file: file_names, unnecessary_this
//"CREATE TABLE aroma(id INTEGER PRIMARY KEY AUTOINCREMENT,num_amostra CHAR, aroma CHAR, aroma2 CHAR)";
class ModeloAromatico{

  late int _id;
  late int _data;
  late String _provador;
  late String _Numamostra;
  late String _aroma;
  late String _Numamostra2;
  late String _aroma2;
  late String _Numamostra3;
  late String _aroma3;
  late String _Numamostra4;
  late String _aroma4;
  late String _Numamostra5;
  late String _aroma5;
  late String _Numamostra6;
  late String _aroma6;
  late String _Numamostra7;
  late String _aroma7;
  late String _Numamostra8;
  late String _aroma8;
  late String _Numamostra9;
  late String _aroma9;
  late String _Numamostra10;
  late String _aroma10;




  ModeloAromatico(this._data,this._provador,this._Numamostra,this._aroma,this._Numamostra2,this._aroma2,this._Numamostra3,this._aroma3
      ,this._Numamostra4,this._aroma4,this._Numamostra5,this._aroma5,this._Numamostra6,this._aroma6
      ,this._Numamostra7,this._aroma7,this._Numamostra8,this._aroma8,this._Numamostra9,this._aroma9,this._Numamostra10,this._aroma10);

/*ModeloAromatico.withid(this._id,this._Numamostra,this._aroma,this._aroma2,this._Numamostra3,this._aroma3
  ,this._Numamostra4,this._aroma4,this._Numamostra5,this._aroma5,this._Numamostra6,this._aroma6
  ,this._Numamostra7,this._aroma7,this._Numamostra8,this._aroma8,this._Numamostra9,this._aroma9,this._Numamostra10,this._aroma10);*/

int get id =>_id;
int get data=>_data;
  String get provador =>_provador;
  String get Numamostra => _Numamostra;
  String get aroma => _aroma;
  String get Numamostra2 => _Numamostra2;
  String get aroma2 => _aroma2;
  String get Numamostra3 => _Numamostra3;
  String get aroma3 => _aroma3;
  String get Numamostra4 => _Numamostra4;
  String get aroma4 => _aroma4;
  String get Numamostra5 => _Numamostra5;
  String get aroma5 => _aroma5;
  String get Numamostra6 => _Numamostra6;
  String get aroma6 => _aroma6;
  String get Numamostra7 => _Numamostra7;
  String get aroma7 => _aroma7;
  String get Numamostra8 => _Numamostra8;
  String get aroma8 => _aroma8;
  String get Numamostra9 => _Numamostra9;
  String get aroma9 => _aroma9;
  String get Numamostra10 => _Numamostra10;
  String get aroma10 => _aroma10;

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


  set Numamostra2(String newNumamostra2) {
    this.Numamostra2 = newNumamostra2;
  }

    set aroma2(String newAroma2){
    this.aroma2= newAroma2;

  }


  set Numamostra3(String newNumamostra){
    this.Numamostra3= newNumamostra;

  }

  set aroma3(String newAroma){
    this.aroma3= newAroma;

  }

  set Numamostra4(String newNumamostra){
    this.Numamostra4= newNumamostra;

  }

  set aroma4(String newAroma){
    this.aroma4= newAroma;

  }
  set Numamostra5(String newNumamostra){
    this.Numamostra5= newNumamostra;

  }

  set aroma5(String newAroma){
    this.aroma5= newAroma;

  }
  set Numamostra6(String newNumamostra){
    this.Numamostra6= newNumamostra;

  }

  set aroma6(String newAroma){
    this.aroma6= newAroma;

  }
  set Numamostra7(String newNumamostra){
    this.Numamostra7= newNumamostra;

  }

  set aroma8(String newAroma){
    this.aroma8= newAroma;

  }
  set Numamostra9(String newNumamostra){
    this.Numamostra9= newNumamostra;

  }

  set aroma9(String newAroma){
    this.aroma9= newAroma;

  }
  set Numamostra10(String newNumamostra){
    this.Numamostra10= newNumamostra;

  }

  set aroma10(String newAroma){
    this.aroma10= newAroma;

  }


  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    map["id"] =_id;
    map["data"] =_data;
    map["provador"] =_provador;
    map['num_amostra']=_Numamostra;
    map['aroma']=_aroma;
    map['num_amostra2']=_Numamostra2;
    map['aroma2']=_aroma2;
    map['num_amostra3']=_Numamostra3;
    map['aroma3']=_aroma3;
    map['num_amostra4']=_Numamostra4;
    map['aroma4']=_aroma4;
    map['num_amostra5']=_Numamostra5;
    map['aroma5']=_aroma5;
    map['num_amostra6']=_Numamostra6;
    map['aroma6']=_aroma6;
    map['num_amostra7']=_Numamostra7;
    map['aroma7']=_aroma7;
    map['num_amostra8']=_Numamostra8;
    map['aroma8']=_aroma8;
    map['num_amostra9']=_Numamostra9;
    map['aroma9']=_aroma9;
    map['num_amostra10']=_Numamostra10;
    map['aroma10']=_aroma10;


    return map;

  }



  ModeloAromatico.fromMapObject(Map<String,dynamic>map){
    this._id =map['id'];
    this._data=map['data'];
    this._provador=map['provador'];
    this._Numamostra=map['num_amostra'];
    this._aroma=map['aroma'];
    this._Numamostra2=map['num_amostra2'];
    this._aroma2=map['aroma2'];
    this._Numamostra3=map['num_amostra3'];
    this._aroma3=map['aroma3'];
    this._Numamostra4=map['num_amostra4'];
    this._aroma4=map['aroma4'];
    this._Numamostra5=map['num_amostra5'];
    this._aroma5=map['aroma5'];
    this._Numamostra6=map['num_amostra6'];
    this._aroma6=map['aroma6'];
    this._Numamostra7=map['num_amostra7'];
    this._aroma7=map['aroma7'];
    this._Numamostra8=map['num_amostra8'];
    this._aroma8=map['aroma8'];
    this._Numamostra9=map['num_amostra9'];
    this._aroma9=map['aroma9'];
    this._Numamostra10=map['num_amostra10'];
    this._aroma10=map['aroma10'];
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
          "caption": _Numamostra2,
          "type": "Interger"
        },
        "arome": {
          "caption": _aroma2,
          "type": "String"
        },

      }
    };

  }











}

