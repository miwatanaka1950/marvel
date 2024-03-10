import 'package:flutter/services.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () { //сделать переход (от)
                Navigator.pop(context);
      },                                //(до)
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 35.0), //отступы слева и пикселей
                child: Icon(
                  Icons.arrow_back_ios,color: Colors.white),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignUp(),
                  _getBottomRow(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader() {
  return Expanded(
    flex: 4,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text('Регистрация',
        style: TextStyle(color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 37),
      ),
    ),
  );
} //

_getInputs(){
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: 'Имя',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Логин',
              labelStyle: TextStyle(color: Colors.white)
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Пароль',
              labelStyle: TextStyle(color: Colors.white)
          ),
        ),
      ],
    ),
  );
}

_getSignUp(){
  return Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Зарегистрироваться', style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        ),
        CircleAvatar( //Создание кнопки
          backgroundColor: Colors.red.shade800,
          radius: 40,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}

_getBottomRow(context) {
  return Expanded(
    flex: 2,
    child: Row(
      children: <Widget>[
        GestureDetector(
        onTap: () {
  Navigator.pop(context);
  },
          child: Text(
            'Вход',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    ),
  );
}

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0,0,sw,sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    //фигура синяя
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.5, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.blue.shade800;
    canvas.drawPath(blueWave, paint);

    //фигура красная
    Path redPath = Path();
    redPath.lineTo(sw, 0);
    redPath.lineTo(sw, sh * 0.3);
    redPath.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    redPath.close();
    paint.color = Colors.red.shade800;
    canvas.drawPath(redPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;
  }
}