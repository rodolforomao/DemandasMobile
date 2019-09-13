
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'demandas_concluidas_view.dart';
import 'demandas_em_andamento_view.dart';
import 'demandas_pendente_view.dart';




class MenuNavigationBarDemandas extends StatefulWidget {


  //DefeitosMenuNavigationBar({Key key, @required this.RodoviaSelecionada ,@required this.UsuarioLogado}) : super(key: key);
  @override
  _MenuNavigationBarDemandas createState() => new _MenuNavigationBarDemandas();
}

class _MenuNavigationBarDemandas extends State<MenuNavigationBarDemandas> {
  final GlobalKey<ScaffoldState>  _ScaffoldKey = GlobalKey<ScaffoldState>();
 // AppDynatestCirBll _AppDynatestCirBll = new AppDynatestCirBll();
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();

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

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _ScaffoldKey,
      appBar: AppBar(
        title: Center(child:Text("Demandas",
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
      body: new PageView(
        children: [
          DemandasPendenteView(),
          DemandasEmAndamentoView(),
          DemandasConcluidasView(),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color(0xFF3497fd),
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(
                color: const Color(0xFF015175),
                fontWeight: FontWeight.bold,
                fontSize: 32.0
            ))),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _page,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today ,size:25),
              title: new Text('Pendente',style: TextStyle(fontFamily: 'Roboto', fontSize: 14.0,)),),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.event,size:25),
              title: new Text("Em Andamento",style: TextStyle(fontFamily: 'Roboto', fontSize: 14.0,)),),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.event_available,size:25),
              title: new Text("Concluídas",style: TextStyle(fontFamily: 'Roboto', fontSize: 14.0,)),),
          ],
          onTap: navigationTapped,
        ),
      ),
    );
  }
}