// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

class TesteDiscriminativo{

  //"CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR ,INT intensidade ,comentario VARCHAR)";


  late int _id;
  late String _amostra_controle;
  late String _amostra_testada;
  late int _intensidade;
  late String _comentario;

  TesteDiscriminativo(this._id,this._amostra_controle,this._amostra_testada,this._intensidade,this._comentario);

  int get id =>_id;
  String get amostra_controle => _amostra_controle;
  String get amostra_testada =>_amostra_testada;
  int get intensidade => _intensidade;
  String get comentario =>_comentario;

  set amostra_controle(String newamostracontrole){
    this.amostra_controle = newamostracontrole;
  }

  set amostra_testada(String newamostratestada){
    this.amostra_testada = newamostratestada;
  }

  set intensidade(int newintensidade){
    this._intensidade = newintensidade;
  }

  set comentario(String newcomentario){
    this._comentario = newcomentario;
  }


  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if( id != null ){
      map["id"] =_id;
    }
    map['amostra_controle']=_amostra_controle;
    map['amostra_testada']=_amostra_testada;
    map['intensidade']=_intensidade;
    map['comentario']=_comentario;
    return map;

  }

  TesteDiscriminativo.fromMapObject(Map<String, dynamic> map){
    this._id =map['id'];
    this._amostra_controle=map['amostra_controle'];
    this._amostra_testada=map['amostra_testada'];
    this._intensidade=map['intensidade'];
    this._comentario=map['comentario'];
  }


}