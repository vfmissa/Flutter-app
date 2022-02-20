

// ignore_for_file: unused_field, file_names, prefer_final_fields

class ModeloComparativo{

  late int _id;
  late int _data;
  late String _provador;
  late String _amostra_controle;
  late String _amostra_testada;
  late String _nota;

   ModeloComparativo(this._data,this._provador,this._amostra_controle,this._amostra_testada,this._nota);
   ModeloComparativo.comId(this._id,this._amostra_controle,this._amostra_testada,this._nota);


  int get id =>_id;
  int get data=>_data;
  String get provador =>_provador;
  String get amostra_controle => _amostra_controle;
  String get amostra_testada =>_amostra_testada;
  String get nota =>_nota;


  set data(int newdata){
    this.data = newdata;
  }
  set provador(String newprovador){
    this.provador= newprovador;

  }

  set amostra_controle(String newamostracontrole){
    this.amostra_controle = newamostracontrole;
  }

  set amostra_testada(String newamostratestada){
    this.amostra_testada = newamostratestada;
  }

  set nota(String newnota){
    this._nota = newnota;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if( id != null ){
      map["id"] =_id;
    }
    map['data']=_data;
    map['provador']=_provador;
    map['amostra_controle']=_amostra_controle;
    map['amostra_testada']=_amostra_testada;
    map['nota']=_nota;
    return map;

  }

ModeloComparativo.fromMapObject(Map<String, dynamic> map){
  this._id =map['id'];
  this.data=map['data'];
  this.provador=map['provador'];
  this._amostra_controle=map['amostra_controle'];
  this._amostra_testada=map['amostra_testada'];
  this.nota=map['nota'];
}


}