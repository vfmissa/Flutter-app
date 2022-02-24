// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, unnecessary_this

class ModeloDiscriminativo{

  late int _id;
  late int _data;
  late String _provador;
  late String _amostra_controle;
  late String _menoscaracteristica;
  late String _mediacaracteristica;
  late String _maiscaracteristica;
  late String _comentario;

  ModeloDiscriminativo(this._data,this._provador,this._amostra_controle,this._menoscaracteristica,this._mediacaracteristica,this._maiscaracteristica,this._comentario);
  ModeloDiscriminativo.comID(this._id,this._amostra_controle,this._menoscaracteristica,this._mediacaracteristica,this._maiscaracteristica,this._comentario);

  int get id =>_id;
  int get data =>_data;
  String get provador=>_provador;
  String get amostra_controle => _amostra_controle;
  String get menoscaracteristica =>_menoscaracteristica;
  String get mediacaracteristica => _mediacaracteristica;
  String get maiscaracteristica => _maiscaracteristica;
  String get comentario =>_comentario;

  set data(int newdata){
    this.data = newdata;
  }
  set provador(String newprovador){
    this.provador= newprovador;

  }
  set amostra_controle(String newamostracontrole){
    this._amostra_controle = newamostracontrole;
  }

  set menoscaracteristica(String newamostratestada){
    this._menoscaracteristica = newamostratestada;
  }

  set mediacaracteristica(String amostra2){
    this._mediacaracteristica = amostra2;
  }

  set maiscaracteristica(String amostra3){
    this._maiscaracteristica = amostra3;
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
    map['amostra_controle']=_amostra_controle;
    map['amostra_testada']=_menoscaracteristica;
    map['amostra2']=_mediacaracteristica;
    map['amostra3']=_maiscaracteristica;
    map['comentario']=_comentario;

    return map;

  }

  ModeloDiscriminativo.fromMapObject(Map<String, dynamic> map){
    this._id =map['id'];
    this._data=map['data'];
    this._provador=map['provador'];
    this._amostra_controle=map['amostra_controle'];
    this._menoscaracteristica=map['amostra_testada'];
    this._mediacaracteristica=map['amostra2'];
    this._maiscaracteristica=map['amostra3'];
    this._comentario=map['comentario'];
  }


  //json
 /* ModeloDiscriminativo.fromJson(Map<String,dynamic>json)
    :_id = json['id'],
        _amostra_controle = json['amostra Controle'],
    _menoscaracteristica =json['amostra 1'],
    _mediacaracteristica=json['amostra2'],
    _maiscaracteristica=json['amostra3'],
    _comentario=json['coment'];*/

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