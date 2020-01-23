import 'package:dash_banco_inter/app/util/change_hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class IdentityUser extends StatefulWidget {
  @override
  _IdentityUserState createState() => _IdentityUserState();
}

class _IdentityUserState extends State<IdentityUser> {

  final hexcolor = HexColors();
  
  bool isget = false;

  @override
  Widget build(BuildContext context) {

  print(isget.toString());


   List listMenu = [
    ['Pedido Coxinha', Icons.kitchen],
    ['Pedido Kibe ', Icons.laptop_mac],
    ['Prêmios Combo', Icons.library_books],
    ['Histórico Pedido', Icons.local_car_wash],
    ['Relátorio Compras', Icons.find_in_page],
    ['Veículo', Icons.category],
    ['Informações de Preço', Icons.youtube_searched_for],
    ['Produtos', Icons.event_busy],
    ['Contato', Icons.fingerprint],
    ['Sobre', Icons.warning],
    
  ];

  var i = 0;

  var number = listMenu.length%3 > 0 ? ((listMenu.length~/3) + 1).toDouble() : listMenu.length/3;      

  int intVar =  (number.toInt() * 108 + number.toInt() * 8);
  double valueContainerMenu = intVar.toDouble();

  //print(valueContainerMenu);

    return Scaffold(
      backgroundColor: Color(hexcolor.hexColor('#E8E8E8')),
      body: Observer(builder: (_) {

      //  RevendedorModel revendedor =  controller.controllerLogin.revendedorModel;

        return SingleChildScrollView(
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                            Color(hexcolor.hexColor('#ed7016')),
                            Color(hexcolor.hexColor('#ed9616')),
                          ]
                    )
                  ),
                 
                ),

                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 42,left: 4, right: 4),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                 
                  child: Column(
                    children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child:  Row(
                                  children: <Widget>[
                                    Text('Fictícia Distribuidora Ltda',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text('Saldo em conta',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("RS ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                
                                    ),
                                  ),
                                  Text("0,00",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800
                
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: isget ? valueContainerMenu : 108 ,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent
                          ),
                         
                          child:  ListView.builder(
                            physics: new NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(0),  
                            itemCount: number.toInt(),
                            itemBuilder: (context, position) {
                              
                              List list = new List(3);
                              list[0] = [i <  listMenu.length ? listMenu[i][0] : null, listMenu[i][1]];
                              list[1] = [i+1 <  listMenu.length ? listMenu[i+1][0] : null, i+1 <  listMenu.length ? listMenu[i+1][1] : null];
                              list[2] = [i+2 <  listMenu.length ? listMenu[i+2][0] : null, i+2 <  listMenu.length ? listMenu[i+2][1] : null];

                              i = i + 3;

                              return Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child:  MenuRow(hexcolor: hexcolor, list: list),
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() { isget = isget ? false : true; });
                          },
                          
                          child: Container(
                            height: 38,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Center(
                              child:  Icon(
                                isget ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color:Color(hexcolor.hexColor('#ed7016')),
                                size: 45.0,
                              ),
                            ),
                          ),
                        ),
                        
                    ],
                  ),
                  
                )
              ],
            ),
          )
        );
      },
      ),
    );
  }
}

class MenuRow extends StatelessWidget {

  final HexColors hexcolor;
  final List list;


  const MenuRow({Key key, this.hexcolor, this.list}) : super(key: key); 

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
         Opacity(
          opacity: list[0][0] == null ? 0.0 : 1.0,
          child: Container(
          height: 105,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
             color: Color(hexcolor.hexColor('#FFFFFF')),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               Container(
                 height: 55,
                 width: 55,
                 decoration: BoxDecoration(
                   color: Color(hexcolor.hexColor('#E8E8E8')),
                   shape: BoxShape.circle,
                 ),
                 child: Icon(
                    list[0][1],
                   color:Color(hexcolor.hexColor('#ed7016')), 
                 ),
               ), 
               Text(
                  list[0][0] == null ? "" : list[0][0], 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
              ],
            ),
          ),
        ),
        Opacity(
          opacity: list[1][0] == null ? 0.0 : 1.0,
          child: Container(
          height: 105,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
             color: Color(hexcolor.hexColor('#FFFFFF')),
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               Container(
                 height: 55,
                 width: 55,
                 decoration: BoxDecoration(
                   color: Color(hexcolor.hexColor('#E8E8E8')),
                   shape: BoxShape.circle,
                 ),
                 child: Icon(
                   list[1][1],
                   color:Color(hexcolor.hexColor('#ed7016')),
                 ),
               ), 
               Text(
                  list[1][0] == null ? "" : list[1][0], 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
              ],
            ),
          ),
        ),
        Opacity(
          opacity: list[2][0] == null ? 0.0 : 1.0,
          child: Container(
          height: 105,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
             color: Color(hexcolor.hexColor('#FFFFFF')),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               Container(
                 height: 55,
                 width: 55,
                 decoration: BoxDecoration(
                   color: Color(hexcolor.hexColor('#E8E8E8')),
                   shape: BoxShape.circle,
                 ),
                 child: Icon(
                   list[2][1],
                   color:Color(hexcolor.hexColor('#ed7016')),
                 ),
                 
               ), 
               Text(
                  list[2][0] == null ? "" : list[2][0], 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      
    );
  }
}
