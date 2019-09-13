import 'dart:ffi';
import 'package:app_gestao_de_demandas/views/demandas_views/menu_navigation_bar_demandas.dart';
import 'package:app_gestao_de_demandas/views/menu_view.dart';
import 'package:app_gestao_de_demandas/views/usuario_views/recuperar_senha_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => _LoginView();
}

class _LoginView  extends State<LoginView> with TickerProviderStateMixin {
  final _ScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
 // ServicoMobileService  _RestWebService = new ServicoMobileService();
  //AppDynatestCirBll  _AppDynatestCirBll = new AppDynatestCirBll();

  AnimationController animationController;
  Animation<double> animation;
  TextEditingController _TxtControllerEmail = TextEditingController();
  TextEditingController _TxtControllerSenha = TextEditingController();
  bool _IsLogando = false, isVisualizarSenha = false;




  void OnToastInformacao(String Mensagem) {
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
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new ScaleTransition(
      scale: animation,
      child: Scaffold(
        key: _ScaffoldKey,
        body: Form(
          key: _FormKey,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xff2A2E40),
              image: new DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: new AssetImage("assets/imagens/bg_login.png"),
                fit: BoxFit.cover,
              ),
            ),
            constraints: BoxConstraints(
              minHeight: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: Color(0xFF99FFFFFF),
                      elevation: 0.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(25.0))),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Image.asset(
                                      "assets/imagens/logo_iri_descricao.png",
                                      width:
                                      400.0, //  height: 180.0,fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Container(
                                      height: 55.0,
                                      decoration: new BoxDecoration(
                                          color: Color(0xFFdddddd),
                                          borderRadius:
                                          new BorderRadius
                                              .circular(4.0)),
                                      child: new Center(
                                        child: TextFormField(
                                          textInputAction:
                                          TextInputAction.next,
                                          controller:
                                          _TxtControllerEmail,
                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: const Color(
                                                  0xFF000000)),
                                          keyboardType: TextInputType
                                              .emailAddress,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.person,
                                              size: 28,
                                              color:
                                              Color(0xFF015175),
                                            ),
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize: 18,
                                              color: const Color(
                                                  0xFF4b5367),
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                            hintText: "E-mail",
                                            fillColor:
                                            Color(0xFF4b5367),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      height: 55.0,
                                      decoration: new BoxDecoration(
                                          color: Color(0xFFdddddd),
                                          borderRadius:
                                          new BorderRadius
                                              .circular(4.0)),
                                      child: new Center(
                                        child: TextFormField(
                                          obscureText: true,
                                          textInputAction:
                                          TextInputAction.done,
                                          controller:
                                          _TxtControllerSenha,
                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: const Color(
                                                  0xFF000000)),
                                          keyboardType:
                                          TextInputType.text,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.https,
                                              size: 27,
                                              color:
                                              Color(0xFF015175),
                                            ),
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize: 18,
                                              color: const Color(
                                                  0xFF4b5367),
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                            hintText: "Senha",
                                            fillColor:
                                            Color(0xFF4b5367),
                                          ),
                                        ),
                                      ),
                                    ),
                                    _RealizarLogin(),

                                    SizedBox(
                                      height: 15.0,
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ), /* add child content here */
          ),
        ),
      ),
    );
  }

  @override
  Widget _RealizarLogin() =>  new Container(
    child: _IsLogando == false ?  StreamBuilder<bool>(
      builder: (context, snapshot) =>Padding(
        padding: EdgeInsets.only(left: 0.0, top: 20.0, bottom: 20.0),
        child: new InkWell(
          child: new Container(
            //width: 100.0,
            height: 53.0,
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(4.0),
                gradient: new LinearGradient(
                    colors: [
                      Color(0xFF015175),
                      Color(0xFF0174a8),
                    ]
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  )
                ]
            ),
            child: new Center(child: Text('Entrar',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),),
          ),
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new MenuView()), (Route<dynamic> route) => false);
          },
        ),
      ),
    ) :  StreamBuilder<bool>(
      // stream: bloc.submitCheck,
      builder: (context, snapshot) =>Padding(
        padding: EdgeInsets.only(left: 0.0, top: 40.0, bottom: 20.0),
        child: new  InkWell(
          child: new Container(
            //width: 100.0,
            height: 53.0,
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(4.0),
                gradient: new LinearGradient(
                    colors: [
                      
                      Color(0xFF015175),
                      Color(0xFF0174a8),
                    ]
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  )
                ]
            ),
            child: new Center(child:  Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: new CircularProgressIndicator(),
            ),),
          ),

        ),
      ),
    ),
  );
}