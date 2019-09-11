
import 'package:app_gestao_de_demandas/views/demandas_views/criar_demanda_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart';

class DemandasEmAndamentoView extends StatefulWidget {
  // final TbUsuario UsuarioLogado;
  // const ListaRodoviasView({Key key, @required this.UsuarioLogado}) : super(key: key);
  @override
  _DemandasEmAndamentoView createState() => _DemandasEmAndamentoView();

}

class _DemandasEmAndamentoView  extends State<DemandasEmAndamentoView> with TickerProviderStateMixin   {
  final GlobalKey<ScaffoldState>  _ScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _RefreshIndicatorKey = GlobalKey<RefreshIndicatorState>();


  //List<TbRodovia> ListaRodoviaModelo = new List<TbRodovia>();
  //AppDynatestCirBll _AppDynatestCirBll = new AppDynatestCirBll();

  AnimationController animationController;
  Animation<double> animation;
  bool ExisteInformacao;




  OnRealizandoOperacao(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  Dialog(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Container(
                margin: const EdgeInsets.only(left:5.0,top: 20.0,bottom: 20.0,right: 10.0),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Color(0xFF6b83bf),),
                  child: new CircularProgressIndicator(),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left:10.0,top: 20.0,bottom: 20.0,right: 5.0),
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

  OnToastInformacao(String Mensagem) {
    final snackBar = SnackBar(
        backgroundColor: Color(0xFF000000),
        duration: Duration(seconds: 4),
        content: Text(Mensagem, style: TextStyle(color: Color(0xFFFFFFFF) ,fontFamily: 'BrandonText_Bold', fontSize: 16.0),)
    );
    _ScaffoldKey.currentState.showSnackBar(snackBar);
  }


  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    CurvedAnimation curve = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animation = Tween(begin: 0.0, end: 1.0).animate(curve);
    super.initState();
    Future(() {
    });
    new Future.delayed(Duration.zero,() {

    });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    new Future.delayed(Duration.zero,() {

    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _ScaffoldKey,
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minHeight: MediaQuery
              .of(context)
              .size
              .height,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/imagens/img_nao_a_registro.png", width: 150.0, height: 150.0, fit: BoxFit.fill,),
                SizedBox(height: 30.0),
                Center( child: Text("Não existem demandas em andamento cadastradas.", textAlign: TextAlign.center,  style: TextStyle(fontFamily: 'BrandonText_Medium',  fontSize: 23.0, color: Color(0xFF545454)),),),
                SizedBox(height: 10.0),

              ],
            ),
          ),
        ), /* add child content here */
      ),
      floatingActionButton: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Color(0xFF3497fd),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new CriarDemandaView()));
          },
          child: Icon(Icons.add , color: Color(0xFFFFFFFF),),

        ),
      ),
    );
  }

}
