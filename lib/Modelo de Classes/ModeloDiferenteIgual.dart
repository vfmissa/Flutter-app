

// ignore_for_file: file_names

class ModeloDiferenteIgual{

  late int _id;
  late int _data;
  late String _julgador;
  late String  _amostra0;
  late String _amostra1;
  late String _amostra2;
  late int _amostradif;
  late String _comentario;



  ModeloDiferenteIgual(this._data,this._julgador,this._amostra0,this._amostra1,
      this._amostra2,this._amostradif,this._comentario);


  int get id=>_id;
  int get data => _data;
  String get julgador => _julgador;
  String get amostra0 => _amostra0;
  String get amostra1 => _amostra1;
  String get amostra2 => _amostra2;
  int get amostradif =>_amostradif;
  String get coment =>_comentario;
  set data(int newdata){
    this.data = newdata;
  }

  set julgador(String newjulgador){
    this.julgador=newjulgador;
  }

  set amostra0(String newamostra0){
    this.amostra0 = newamostra0;
  }


  set amostra1(String newamostra1){
    this.amostra1 = newamostra1;
  }

  set amostra2(String newamostra2){
    this.amostra2 = newamostra2;
  }

  set amostradif(int newamostradif){
    this.amostradif = newamostradif;
  }

  set coment(String newcoment){
    this.coment = newcoment;
  }


  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if( id != null ){
      map["id"] =_id;
    }
    map['data']=_data;
    map['julgador']=_julgador;
    map['amostra0']=_amostra0;
    map['amostra1']=_amostra1;
    map['amostra2']=_amostra2;
    map['amostradif']=_amostradif;
    map['coment']=_comentario;
    return map;

  }

    ModeloDiferenteIgual.fromMapObject(Map<String,dynamic>map){

      this._id=map["id"];
      this._data=map["data"];
      this._julgador=map["julgador"];
      this._amostra0=map["amostra0"];
      this._amostra1=map["amostra1"];
      this._amostra2=map["amostra2"];
      this._amostradif=map["amostradif"];
      this._comentario= map['coment'];

    }







}