// ignore_for_file: file_names, unnecessary_this

class ModeloAvaliativo{

  late int _id;
  late int _data;
  late String _provador;
  late String _amostra_controle;
  late String _amostra_1;
  late String _nota1;
  late String _amostra_2;
  late String _nota2;
  late String _amostra_3;
  late String _nota3;
  late String _amostra_4;
  late String _nota4;

  ModeloAvaliativo(this._data,this._provador,this._amostra_controle,this._amostra_1,this._nota1,
  this._amostra_2,this._nota2,this._amostra_3,this._nota3,this._amostra_4,this._nota4);



  int get id =>_id;
  int get data =>_data;
  String get provador=>_provador;
  String get amostra_controle => _amostra_controle;
  String get amostra_1 =>_amostra_1;
  String get nota1 =>_nota1;
  String get amostra_2 =>_amostra_2;
  String get nota2 =>_nota2;
  String get amostra_3 =>_amostra_3;
  String get nota3 =>_nota3;
  String get amostra_4 =>_amostra_4;
  String get nota4 =>_nota4;



  set data(int newdata){
    this.data = newdata;
  }
  set provador(String newprovador){
    this.provador= newprovador;

  }
  set amostra_controle(String newamostracontrole){
    this.amostra_controle = newamostracontrole;
  }

  set amostra_1(String newamostratestada){
    this.amostra_1 = newamostratestada;
  }
  set nota1(String newnota1){
    this.nota1 = newnota1;
  }


  set amostra_2(String newamostratestada){
    this.amostra_2 = newamostratestada;
  }

  set nota2(String newnota2){
    this.nota2 = newnota2;
  }

  set amostra_3(String newamostratestada){
    this.amostra_3 = newamostratestada;
  }

  set nota3(String newnota3){
    this.nota3 = newnota3;
  }
  set amostra_4(String newamostratestada){
    this.amostra_4 = newamostratestada;
  }

  set nota4(String newnota4){
    this.nota4 = newnota4;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if( id != null ){
      map["id"] =_id;
    }
    map["data"]=_data;
    map['provador']=_provador;
    map['amostra_controle']=_amostra_controle;
    map['amostra1']=_amostra_1;
    map['nota1']=_nota1;
    map['amostra2']=_amostra_2;
    map['nota2']=_nota2;
    map['amostra3']=_amostra_3;
    map['nota3']=_nota3;
    map['amostra4']=_amostra_4;
    map['nota4']=_nota4;
    return map;

  }

  ModeloAvaliativo.fromMapObject(Map<String, dynamic> map){
    this._id =map['id'];
    this._data=map['data'];
    this._provador=map['provador'];
    this._amostra_controle=map['amostra_controle'];
    this._amostra_1=map['amostra1'];
    this._nota1=map['nota1'];
    this._amostra_2=map['amostra2'];
    this._nota2=map['nota2'];
    this._amostra_3=map['amostra3'];
    this._nota3=map['nota3'];
    this._amostra_4=map['amostra4'];
    this._nota4=map['nota4'];
  }


}