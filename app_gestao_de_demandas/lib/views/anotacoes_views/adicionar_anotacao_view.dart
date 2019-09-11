
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

  String _TxtDropUf, _TxtPista, _TxtSentido, _TxtPavimentacao = null;
  TextEditingController _TxtControllerRodovia = TextEditingController();
  TextEditingController _TxtControllerFaixa = TextEditingController();
  TextEditingController _TxtControllerData = TextEditingController();
  TextEditingController _TxtControllerKmInicio = TextEditingController();
  TextEditingController _TxtControllerKmFinal = TextEditingController();

  bool _Validate = false, ExisteInformacao ,_IsNovo = true;
  List<String> Uf = new List<String>();
  List<String> Pista = new List<String>();
  List<String> Sentido = new List<String>();
  List<String>  Pavimentacao = new List<String>();



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
                Color(0xFF0174a8),
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
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                  StreamBuilder<String>(
                    builder: (context, snapshot) => FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: Color(0xFF040006)),
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color(0xFF040006))),
                              hintText: "Selecione...",
                              fillColor: Color(0xFF040006),
                              errorText: snapshot.error),
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                                isExpanded: true,
                                value: _TxtDropUf,
                                isDense: true,
                                items: Uf.map((String value) {
                                  return new DropdownMenuItem(
                                    value: value,
                                    child:  Text("${value}",
                                        style: TextStyle(
                                            fontFamily:
                                            'Roboto_Regular',
                                            fontSize: 20.0,
                                            color:
                                            Color(0xFF040006))),);
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    _TxtDropUf = value;
                                  });
                                }),
                          ),
                        );
                      },
                      enabled: _IsNovo,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Rodovia*',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  StreamBuilder<String>(
                    //  stream: bloc.password,
                    builder: (context, snapshot) => TextFormField(
                      validator: (String arg) {
                        if (arg.isEmpty)
                          return 'Por favor, preencher a rodovia';
                        else
                          return null;
                      },
                      onSaved: (String val) {
                        _TxtControllerRodovia.text = val;
                      },
                      maxLines: 1,
                      controller: _TxtControllerRodovia,
                      autofocus: false,
                      enabled: _IsNovo,
                      maxLength: 3,
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF040006)),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                              padding:
                              EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
                              child: Text(
                                "BR - ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Roboto_Bold',
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              )),
                          labelStyle: TextStyle(color: Color(0xFF040006)),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                              new BorderSide(color: Color(0xFF040006))),
                          fillColor: Color(0xFF040006),
                          errorText: snapshot.error),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Pista*',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  StreamBuilder<String>(
                    builder: (context, snapshot) => FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: Color(0xFF040006)),
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color(0xFF040006))),
                              hintText: "Selecione...",
                              enabled: _IsNovo,
                              fillColor: Color(0xFF040006),
                              errorText: snapshot.error),
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                                isExpanded: false,
                                value: _TxtPista,
                                isDense: true,
                                items: Pista.map((String value) {
                                  return new DropdownMenuItem(
                                    value: value,
                                    child:  Text("${value}",
                                        style: TextStyle(
                                            fontFamily:
                                            'Roboto_Regular',
                                            fontSize: 20.0,
                                            color:
                                            Color(0xFF040006))),);
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    _TxtPista = value;
                                  });
                                }),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Faixa*',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  StreamBuilder<String>(
                    //  stream: bloc.password,
                    builder: (context, snapshot) => TextFormField(
                      validator: (String arg) {
                        if (arg.isEmpty)
                          return 'Por favor, preencher a faixa';
                        else
                          return null;
                      },
                      onSaved: (String val) {
                        _TxtControllerFaixa.text = val;
                      },
                      autofocus: false,
                      enabled: _IsNovo,
                      maxLength: 4,
                      controller: _TxtControllerFaixa,
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF423e3e)),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFF423e3e)),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                              new BorderSide(color: Color(0xFF040006))),
                          hintText: "Faixa",
                          fillColor: Color(0xFF040006),
                          errorText: snapshot.error),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Sentido*',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  StreamBuilder<String>(
                    builder: (context, snapshot) => FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: Color(0xFF040006)),
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color(0xFF040006))),
                              hintText: "Selecione...",
                              enabled: _IsNovo,
                              fillColor: Color(0xFF040006),
                              errorText: snapshot.error),
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                                isExpanded: false,
                                value: _TxtSentido,
                                isDense: true,
                                items: Sentido.map((String value) {
                                  return new DropdownMenuItem(
                                    value: value,
                                    child:  Text("${value}",
                                        style: TextStyle(
                                            fontFamily:
                                            'Roboto_Regular',
                                            fontSize: 20.0,
                                            color:
                                            Color(0xFF040006))),);
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    _TxtSentido = value;
                                  });
                                }),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Pavimentação*',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  StreamBuilder<String>(
                    builder: (context, snapshot) => FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: Color(0xFF040006)),
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color(0xFF040006))),
                              hintText: "Selecione...",
                              enabled: _IsNovo,
                              fillColor: Color(0xFF040006),
                              errorText: snapshot.error),
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                                isExpanded: false,
                                value: _TxtPavimentacao,
                                isDense: true,
                                items: Pavimentacao.map((String value) {
                                  return new DropdownMenuItem(
                                    value: value,
                                    child:  Text("${value}",
                                        style: TextStyle(
                                            fontFamily:
                                            'Roboto_Regular',
                                            fontSize: 20.0,
                                            color:
                                            Color(0xFF040006))),);
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    _TxtPavimentacao = value;
                                  });
                                }),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Data*',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  StreamBuilder<String>(
                    //  stream: bloc.password,
                    builder: (context, snapshot) => TextFormField(
                      validator: (String arg) {
                        if (arg.isEmpty)
                          return 'Por favor, preencher a data';
                        else
                          return null;
                      },
                      onSaved: (String val) {
                        _TxtControllerData.text = val;
                      },
                      autofocus: false,
                      enabled: false,
                      controller: _TxtControllerData,
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF423e3e)),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            size: 25,
                            color: Color(0xFF040006),
                          ),
                          labelStyle: TextStyle(color: Color(0xFF423e3e)),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                              new BorderSide(color: Color(0xFF040006))),
                          hintText: "Data*",
                          fillColor: Color(0xFF040006),
                          errorText: snapshot.error),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Km*',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto_Regular',
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            child: StreamBuilder<String>(
                              //  stream: bloc.password,
                              builder: (context, snapshot) => TextFormField(
                                validator: (String arg) {
                                  if (arg.isEmpty)
                                    return 'Por favor, preencher km inicial';
                                  else
                                    return null;
                                },
                                onSaved: (String val) {
                                  _TxtControllerKmInicio.text = val;
                                },
                                maxLines: 1,
                                enabled: _IsNovo,
                                controller: _TxtControllerKmInicio,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: const Color(0xFF423e3e)),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelStyle:
                                    TextStyle(color: Color(0xFF423e3e)),
                                    enabledBorder: new UnderlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Color(0xFF040006))),
                                    hintText: "KM Inicial*",
                                    fillColor: Color(0xFF040006),
                                    errorText: snapshot.error),
                              ),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: StreamBuilder<String>(
                              //  stream: bloc.password,
                              builder: (context, snapshot) => TextFormField(
                                validator: (String arg) {
                                  if (arg.isEmpty)
                                    return 'Por favor, preencher km final';
                                  else
                                    return null;
                                },
                                onSaved: (String val) {
                                  _TxtControllerKmFinal.text = val;
                                },
                                maxLines: 1,
                                enabled: _IsNovo,
                                controller: _TxtControllerKmFinal,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: const Color(0xFF423e3e)),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelStyle:
                                    TextStyle(color: Color(0xFF423e3e)),
                                    enabledBorder: new UnderlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Color(0xFF040006))),
                                    hintText: "KM final*",
                                    fillColor: Color(0xFF040006),
                                    errorText: snapshot.error),
                              ),
                            ),
                          )),
                    ],
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




