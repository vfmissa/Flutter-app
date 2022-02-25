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
  late String _amostra_5;
  late String _nota5;
  late String _amostra_6;
  late String _nota6;
  late String _amostra_7;
  late String _nota7;
  late String _amostra_8;
  late String _nota8;
  late String _amostra_9;
  late String _nota9;
  late String _amostra_10;
  late String _nota10;

  ModeloAvaliativo(this._data,this._provador,this._amostra_controle,this._amostra_1,this._nota1,
  this._amostra_2,this._nota2,this._amostra_3,this._nota3,this._amostra_4,this._nota4,this._amostra_5,this._nota5,this._amostra_6,this._nota6
      ,this._amostra_7,this._nota7,this._amostra_8,this._nota8,this._amostra_9,this._nota9,this._amostra_10,this._nota10);




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
  String get amostra_5 =>_amostra_5;
  String get nota5 =>_nota5;
  String get amostra_6 =>_amostra_6;
  String get nota6 =>_nota6;
  String get amostra_7 =>_amostra_7;
  String get nota7 =>_nota7;
  String get amostra_8 =>_amostra_8;
  String get nota8 =>_nota8;
  String get amostra_9 =>_amostra_9;
  String get nota9 =>_nota9;
  String get amostra_10=>_amostra_10;
  String get nota10=>_nota10;



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

  set amostra_5(String newamostratestada){
    this.amostra_5 = newamostratestada;
  }

  set nota5(String newnota){
    this.nota5 = newnota;
  }
  set amostra_6(String newamostratestada){
    this.amostra_6 = newamostratestada;
  }

  set nota6(String newnota){
    this.nota6 = newnota;
  }
  set amostra_7(String newamostratestada){
    this.amostra_7 = newamostratestada;
  }

  set nota7(String newnota){
    this.nota7 = newnota;
  }

  set amostra_8(String newamostratestada8){
    this.amostra_8 = newamostratestada8;
  }

  set nota8(String newnota8){
    this.nota8 = newnota8;
  }

  set amostra_9(String newamostratestada9){
    this.amostra_9 = newamostratestada9;
  }

  set nota9(String newnota){
    this.nota9 = newnota;
  }

  set amostra_10(String newamostratestada){
    this.amostra_10 = newamostratestada;
  }

  set nota10(String newnota){
    this.nota10 = newnota;
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
    map['amostra5']=_amostra_5;
    map['nota5']=_nota5;
    map['amostra6']=_amostra_6;
    map['nota6']=_nota6;
    map['amostra7']=_amostra_7;
    map['nota7']=_nota7;
    map['amostra8']=_amostra_8;
    map['nota8']=_nota8;
    map['amostra9']=_amostra_9;
    map['nota9']=_nota9;
    map['amostra10']=_amostra_10;
    map['nota10']=_nota10;
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
    this._amostra_5=map['amostra5'];
    this._nota5=map['nota5'];
    this._amostra_6=map['amostra6'];
    this._nota6=map['nota6'];
    this._amostra_7=map['amostra7'];
    this._nota7=map['nota7'];
    this._amostra_8=map['amostra8'];
    this._nota8=map['nota8'];
    this._amostra_9=map['amostra9'];
    this._nota9=map['nota9'];
    this._amostra_10=map['amostra10'];
    this._nota10=map['nota10'];

  }


}