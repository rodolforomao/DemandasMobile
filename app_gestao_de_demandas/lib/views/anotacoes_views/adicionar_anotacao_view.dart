
import 'package:app_gestao_de_demandas/views/ajuda/componentes.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';


class AdicionarAnotacaoView extends StatefulWidget {


  //RodoviaView({Key key, this.rodoviaSelecionada ,  @required this.usuarioLogado}) : super(key: key);

  @override
  _AdicionarAnotacaoView createState() => _AdicionarAnotacaoView();
}

class _AdicionarAnotacaoView extends State<AdicionarAnotacaoView> with TickerProviderStateMixin {
  final _ScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  //AppDynatestCirBll _AppDynatestCirBll = new AppDynatestCirBll();
 // List<TbRodovia> ListaRodoviaModelo = new List<TbRodovia>();
  AnimationController animationController;
  Animation<double> animation;

  String _TxtDropUf, _TxtBr, _TxtContrato;
  TextEditingController _TxtControllerRodovia = TextEditingController();
  TextEditingController _TxtControllerFaixa = TextEditingController();
  TextEditingController _TxtControllerData = TextEditingController();
  TextEditingController _TxtControllerKmInicio = TextEditingController();
  TextEditingController _TxtControllerKmFinal = TextEditingController();

  bool _Validate = false, ExisteInformacao ,_IsNovo = true;
  List<String> onListaUf = new List<String>();
  List<String> onListaBr = new List<String>();
  List<String> onListContrato = new List<String>();




  OnRealizandoOperacao(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Container(
                margin: const EdgeInsets.only(
                    left: 5.0, top: 20.0, bottom: 20.0, right: 10.0),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    accentColor: Color(0xFF3497FD),
                  ),
                  child: new CircularProgressIndicator(),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(
                    left: 10.0, top: 20.0, bottom: 20.0, right: 5.0),
                child: new Text(
                  "Realizando  operação...",
                  maxLines: null,
                  style: new TextStyle(
                      fontFamily: 'BrandonText_Bold',
                      fontSize: 17.0,
                      color: Color(0xFF656565)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  OnAlertaInformacao(context, String Mensagem) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text(
            Mensagem,
            style: TextStyle(
                fontFamily: 'BrandonText_Medium',
                color: Color(0xFF040006),
                fontSize: 20.0),
          ),
          actions: <Widget>[
            new FlatButton(
              child: Text(
                'OK',
                style: TextStyle(
                    color: const Color(0xFF353A50),
                    fontSize: 20,
                    fontFamily: 'BrandonText_Bold',
                    decoration: TextDecoration.underline),
              ),
              onPressed: () {
                Navigator.pop(context, null);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  OnToastInformacao(String Mensagem) {
    final snackBar = SnackBar(
        backgroundColor: Color(0xFF000000),
        duration: Duration(seconds: 4),
        content: Text(
          Mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Roboto_Regular',
              fontSize: 20.0),
        ));
    _ScaffoldKey.currentState.showSnackBar(snackBar);
  }



  Inc() async {
    onListaUf = await Componentes.onListaUF() as List<String>;
    onListaBr = await Componentes.onListaUF() as List<String>;
    onListContrato = await Componentes.onListaUF() as List<String>;
    setState(() {
      _TxtBr = onListaUf.first;
      _TxtContrato= onListaUf.first;
      _TxtDropUf = onListaUf.first;

    });
  }


  @override
  void initState() {

    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    CurvedAnimation curve =
    CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animation = Tween(begin: 0.0, end: 1.0).animate(curve);
    super.initState();

    new Future.delayed(Duration.zero, () {});
    animationController.forward();
    Inc();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _ScaffoldKey,
      appBar: AppBar(
        title: Center(child:Text("Anotações",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),) ,),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFF015175),
                Color(0xFF1a81b0),
              ],
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )
        ),
      ),
      body: Form(
        key: _FormKey,
        autovalidate: _Validate,
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'UF*',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 55.0,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    decoration: new BoxDecoration(
                        color: Color(0xFFdddddd),
                        borderRadius: new BorderRadius.circular(4.0)),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          isExpanded: true,
                          value: _TxtDropUf,
                          items: onListaUf.map((String value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: Text("${value}",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                      color: Color(0xFF040006))),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _TxtDropUf = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'BR*',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 55.0,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    decoration: new BoxDecoration(
                        color: Color(0xFFdddddd),
                        borderRadius: new BorderRadius.circular(4.0)),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          isExpanded: true,
                          value: _TxtBr,
                          items: onListaBr.map((String value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: Text("${value}",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                      color: Color(0xFF040006))),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _TxtBr = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Contrato*',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 55.0,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    decoration: new BoxDecoration(
                        color: Color(0xFFdddddd),
                        borderRadius: new BorderRadius.circular(4.0)),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          isExpanded: true,
                          value: _TxtContrato,
                          items: onListContrato.map((String value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: Text("${value}",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                      color: Color(0xFF040006))),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _TxtContrato = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    color: Color(0xFFfefeb5),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(0.0), topRight:Radius.circular(0.0), bottomRight: Radius.circular(25.0), bottomLeft:Radius.circular(0.0)),
                    ),
                    child:  Container(
                      height: 200.0,
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 20.0,
                            child: const DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Color(0xFF98eecf),
                              ),
                            ),
                          ),
                          InkWell(
                            child: new Container(
                              //width: 100.0,
                              height: 53.0,
                              decoration: new BoxDecoration(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      4.0),
                                  gradient:
                                  new LinearGradient(colors: [
                                    Color(0xFF015175),
                                    Color(0xFF0174a8),
                                  ]),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey[500],
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    )
                                  ]),
                              child: new Center(
                                child: Text(
                                  'Escolha um arquivo',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 100.0,
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            decoration: new BoxDecoration(
                                color: Color(0xFFdddddd),
                                borderRadius: new BorderRadius.circular(4.0)),
                            child: new Center(
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 20, color: const Color(0xFF000000)),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: const Color(0xFF4b5367),
                                  ),
                                  fillColor: Color(0xFF4b5367),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  Card(
                    color: Color(0xFF0b5fee4),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(0.0), topRight:Radius.circular(0.0), bottomRight: Radius.circular(25.0), bottomLeft:Radius.circular(0.0)),
                    ),
                    child:  Container(
                      height: 200.0,

                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 20.0,
                            child: const DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Color(0xFF98eecf),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                    child:  Container(
                                      height: 55.0,
                                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                                      decoration: new BoxDecoration(
                                          color: Color(0xFF98eecf),
                                          borderRadius: new BorderRadius.circular(4.0)),
                                      child: new Center(
                                        child: TextFormField(
                                          textInputAction: TextInputAction.next,

                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: const Color(0xFF000000)),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: const Color(0xFF4b5367),
                                            ),
                                            hintText: "Assunto",
                                            fillColor: Color(0xFF4b5367),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  height: 55.0,
                                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                                  decoration: new BoxDecoration(
                                      color: Color(0xFF98eecf),
                                      borderRadius: new BorderRadius.circular(4.0)),
                                  child: new Center(
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,

                                      autofocus: false,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: const Color(0xFF000000)),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: const Color(0xFF4b5367),
                                        ),
                                        hintText: "Nº SEI / Nº Documento",
                                        fillColor: Color(0xFF4b5367),
                                      ),
                                    ),
                                  ),
                                ),),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 55.0,
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                            decoration: new BoxDecoration(
                                color: Color(0xFF98eecf),
                                borderRadius: new BorderRadius.circular(4.0)),
                            child: new Center(
                              child: TextFormField(
                                textInputAction: TextInputAction.next,

                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: const Color(0xFF000000)),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: const Color(0xFF4b5367),
                                  ),
                                  hintText: "Escreva aqui...",
                                  fillColor: Color(0xFF4b5367),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), /* add child content here */
        ),
      ),
      floatingActionButton: _IsNovo == true ? FittedBox(
        child: FloatingActionButton(
          backgroundColor: Color(0xFF3497FD),
          onPressed: () {

          },
          child: Icon(
            Icons.check,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ) : null,
    );
  }
}




