import 'package:appfitness/pages/calculadora_imc.dart';
import 'package:appfitness/pages/nosotros.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'App Fitness',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //creamos un arreglo de datos imagenes y nombre ejercicio
  List<Container> listamos = List();

  var arreglox = [
    {
      "nombre": "Pierna",
      "imagen": "barra2.jpg",
      "deporte": "Trabajo con polea 4 repeticiones de 12"
    },
    {
      "nombre": "Pesas",
      "imagen": "pesas.jpg",
      "deporte": "Trabajo con pesas....."
    },
    {
      "nombre": "Cinta Elastica",
      "imagen": "cinta.jpg",
      "deporte": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Cinta",
      "imagen": "cinta2.jpg",
      "deporte": "Trabajo con cinta 2 repeticiones de 15"
    },
    {
      "nombre": "Gluteos",
      "imagen": "gluteos.jpg",
      "deporte": "Trabajo con mancuerna 4 repeticiones de 15"
    },
  ];

  //recorremos el arreglo
  _listado() async {
    for (var i = 0; i < arreglox.length; i++) {
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];

      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(children: <Widget>[
            new Hero(
              tag: arregloxyz['nombre'],
              child: new Material(
                  child: new InkWell(
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new Detalle(
                                  nombre: arregloxyz['nombre'],
                                  imagen: imagen,
                                  deporte: arregloxyz['deporte']))),
                      child: new Image.asset(
                        "assets/img/$imagen",
                        fit: BoxFit.contain,
                      ))),
            ),
            new Padding(
              padding: new EdgeInsets.all(3.0),
            ),
            new Text(
              arregloxyz['nombre'],
              style: new TextStyle(fontSize: 20.0),
            )
          ]),
        ),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _listado();
  }

  //creamos layout o diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Fitness 2020'),
        backgroundColor: Colors.orange,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Ejercicios'),
              accountEmail: new Text('codingoalphacol@gmail.com'),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/img/gluteos.jpg'),
                ),
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Calculadora IMC"),
              trailing: new Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Calculadora(),
              )),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Soporte"),
              trailing: new Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Nosotros(),
              )),
            ),
          ],
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 0.1,
        childAspectRatio: 0.700,
        children: listamos,
      ),
    );
  }
}

//creamos la clase detalle
class Detalle extends StatelessWidget {
  Detalle({this.nombre, this.imagen, this.deporte});

  final String nombre;
  final String imagen;
  final String deporte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new ListView(children: <Widget>[
          new Container(
            height: 387.0,
            child: new Hero(
              tag: nombre,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "assets/img/$imagen",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          new IniciarNombre(
            nombre: nombre,
          ),
          new IniciarIcon(),
          new Informacion(
            deporte: deporte,
          )
        ]));
  }
}

class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre});

  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nombre\@gmail.com",
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTec(icon: Icons.call, tec: "Llamar"),
          new IconTec(icon: Icons.message, tec: "Whatsapp"),
          new IconTec(icon: Icons.photo, tec: "Foto"),
        ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon, this.tec});

  final IconData icon;
  final String tec;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.deporte});

  final String deporte;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            deporte,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
