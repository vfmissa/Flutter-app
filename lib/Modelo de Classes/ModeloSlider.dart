// ignore_for_file: file_names


class ModeloSlider{

  late int _id;
  late int _data;
  late String _provador;
  late String _amostra;
  late String _caracteristica;
  late double _valor_slider;
  late String _comentario;


  ModeloSlider(this._data,this._provador,this._amostra,this._caracteristica,this._valor_slider,this._comentario);


  int get id=>_id;
  int get data => _data;
  String get provador =>_provador;
  String get amostra => _amostra;
  String get caracteristica => _caracteristica;
  double get valor_slider => _valor_slider;
  String get comentario => _comentario;

  set data(int newdata){
    this.data = newdata;
  }

  set provador(String newprovador){
    this.provador= newprovador;

  }

  set amostra(String newamostra){
    this.amostra = newamostra;
  }

  set caracteristica(String newcaracteristica){
    this.caracteristica = newcaracteristica;
  }

  set valor_slider(double newslider){
    this.valor_slider = newslider;
  }

  set comentario(String newcoment){
    this.comentario = newcoment;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if( id != null ){
      map["id"] =_id;
    }
    map['data']=_data;
    map["provador"] =_provador;
    map['amostra']=_amostra;
    map['caracteristica']=_caracteristica;
    map['valor_slider']=_valor_slider;
    map['comentario']=_comentario;
    return map;

  }
 ModeloSlider.fromMapObject(Map<String,dynamic>map){
    this._id=map['id'];
    this._data=map['data'];
    this._provador=map["provador"];
    this._amostra=map['amostra'];
    this._caracteristica=map['caracteristica'];
    this._valor_slider=map['valor_slider'];
    this._comentario=map['comentario'];
 }


}