import 'package:flutter/material.dart';

class RecuperarSenhaView extends StatefulWidget {
  @override
  _RecuperarSenhaView createState() => _RecuperarSenhaView();
}

class _RecuperarSenhaView extends State<RecuperarSenhaView>
    with TickerProviderStateMixin {
  final _ScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  AnimationController animationController;
  Animation<double> animation;
  TextEditingController _TxtControllerEmail = TextEditingController();

  //ServicoMobileService  _RestWebService = new ServicoMobileService();

  bool _IsLogando = false;
  bool _IsSenhaRecuperada = false;

  void OnToastInformacao(String Mensagem) {
    final snackBar = SnackBar(
        backgroundColor: Color(0xFF000000),
        duration: Duration(seconds: 4),
        content: Text(
          Mensagem,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'BrandonText_Bold',
              fontSize: 16.0),
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
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new ScaleTransition(
      scale: animation,
      child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.6),
          key: _ScaffoldKey,
          body: Form(
            key: _FormKey,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: new AssetImage("assets/imagens/bg_login.png"),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: Card(
                      color: Color(0xFF99FFFFFF),
                      elevation: 0.0,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/imagens/logo_iri_descricao.png",
                              width: 400.0, //  height: 180.0,fit: BoxFit.fill,
                            ),
                            _IsSenhaRecuperada == false
                                ? WidgetRecuperarSenha()
                                : WidgetRecuperarSenhaInformacao(),
                          ],
                        ),
                      )),
                ),
              ), /* add child content here */
            ),
          )),
    );
  }

  @override
  Widget WidgetRecuperarSenha() => Container(
        padding:
            EdgeInsets.only(left: 0.0, top: 40.0, bottom: 20.0, right: 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Digite seu endereço de e-mail que enviaremos instruções para redefinir sua senha',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22.0,
                  color: Color(0xFF000000)),
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
            SizedBox(height: 20.0),
            _RealizarLogin(),
          ],
        ),
      );

  @override
  Widget WidgetRecuperarSenhaInformacao() => Container(
        padding:
            EdgeInsets.only(left: 0.0, top: 40.0, bottom: 20.0, right: 0.0),
        child: Column(
          children: <Widget>[

            Text(
              'Pronto! As instruções para redefinição de senha foram enviadas para o seu e-mail.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'BrandonText_Medium',
                  fontSize: 22.0,
                  color: Color(0xFF000000)),
            ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: new Container(
                height: 55.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF015175),
                        Color(0xFF0174a8),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
                child: Center(
                  child: Text(
                    'VOLTAR',
                    style: TextStyle(
                      fontFamily: 'BrandonText_Bold',
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget _RealizarLogin() => new Container(
        child: _IsLogando == false
            ? Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Container(
                        height: 55.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF015175),
                                Color(0xFF0174a8),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0))),
                        child: Center(
                          child: Text(
                            'Voltar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      child: new Container(
                        //width: 100.0,
                        height: 55.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF015175),
                                Color(0xFF0174a8),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0))),
                        child: new Center(
                          child: Text(
                            'Enviar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  )),
                ],
              )
            : StreamBuilder<bool>(
                // stream: bloc.submitCheck,
                builder: (context, snapshot) => Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 45.0, bottom: 20.0),
                  child: new InkWell(
                    child: new Container(
                      //width: 100.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF015175),
                              Color(0xFF0174a8),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(2.0))),
                      child: new Center(
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(accentColor: Colors.white),
                          child: new CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      );
}
