import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(MyApp());
}
final double MAX_WIDTH = 1440;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: ContentWidget(
            child: Column(
              children: [
                HeaderWidget(),
                SizedBox(height: 8.0,),
                BrandsWidget(),
                SizedBox(height: 8.0,),
                FeaturedWidget(),
                SizedBox(height: 8.0,),
                ItemsWidget(),
                SizedBox(height: 8.0,),
                ServicesWidget(),
                SizedBox(height: 8.0,),
                FormWidget(),
                SizedBox(height: 8.0,),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final Widget child;
  const ContentWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenSize.width < MAX_WIDTH ? screenSize.width : MAX_WIDTH,
          child: child,
        ),
      ],
    );
  }
}

class HideIf extends StatelessWidget {
  final double widthLessThan;
  final Widget child;

  const HideIf({Key? key, required this.widthLessThan, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (screenSize.width > widthLessThan) {
      return child;
    }
    return Container();
  }
}


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  get width => null;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var width = screenSize.width < MAX_WIDTH ? screenSize.width : MAX_WIDTH;

    return Container(
      height: width * 3 / 7.0,
      child: Row(
        children: [
          Container(
            color: Color(0xff1D8179),
            width: width * 3 / 7.0,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: _headline(context),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('assets/candlesbackgr.jpg'),
                  fit: BoxFit.cover,
                )
              ),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
  Widget _headline(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    var width = screenSize.width < MAX_WIDTH ? screenSize.width : MAX_WIDTH;

    double leftPadding = lerpDouble(8, 180, (width - 500) / MAX_WIDTH)!.toDouble();
    double otherPadding = lerpDouble(4, 40, (width - 500) / MAX_WIDTH)!.toDouble();
    double titleFontSize = lerpDouble(12, 45, (width - 500) / MAX_WIDTH)!.toDouble();
    double subtitleFontSize = lerpDouble(8, 16, (width - 500) / MAX_WIDTH)!.toDouble();
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: otherPadding,
        top: otherPadding,
        bottom: otherPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Conmemorate con un maceta de tuyeso",
            style: TextStyle(
              color: Colors.white,
              fontSize: titleFontSize,//30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Ex es laboris est proident volvptate veniam. Esse id Lorem ipsvm lvcerna statis maximvs",
            style: TextStyle(
              color: Colors.white,
              fontSize: subtitleFontSize,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              GFButton(
                onPressed: () {},
                text: "Shop Now",
                color: Colors.orange,
                shape: GFButtonShape.square,
              ),
              SizedBox(
                width: 12,
              ),
              HideIf(
                  widthLessThan: 700,
                  child: GFButton(
                    onPressed: (){},
                    text: "Try to my Room",
                    color: Colors.white,
                    textColor: Colors.white,
                    shape: GFButtonShape.square,
                    type: GFButtonType.outline,
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BrandsWidget extends StatelessWidget {
  const BrandsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(width: 100,height: 80, child: Placeholder()),
        Container(width: 100,height: 80, child: Placeholder()),
        Container(width: 100,height: 80, child: Placeholder()),
        Container(width: 100,height: 80, child: Placeholder()),
      ],
    );
  }
}

class FeaturedWidget extends StatefulWidget {
  const FeaturedWidget({Key? key}) : super(key: key);

  @override
  _FeaturedWidgetState createState() => _FeaturedWidgetState();
}

class _FeaturedWidgetState extends State<FeaturedWidget> {
  int currentSelection = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        children: [
          _header(),
          Expanded(
              child: _content()
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Text('Nostra item\nmostrar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            width: 2.0,
            color: Colors.grey,
            height: 40.0,
          ),
        ),
        Flexible(child: Text("Ex es laboris est proident volvptate veniam. Esse id Lorem ipsvm lvcerna statis maximvs")),
      ],
    );
  }

  Widget _content() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.biggest.width * 0.2),
                  child: Image.asset('assets/photo_2021-08-10_circle_dbrown.jpg'),
                ),
              ),
              Positioned(
                right: constraints.biggest.width * 0.2 /2.5,
                top: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Color\nchoice"),
                    _choice(Colors.brown, 0, currentSelection == 0),
                    SizedBox(height: 10,),
                    _choice(Colors.green, 1, currentSelection == 1),
                    SizedBox(height: 10,),
                    _choice(Colors.red, 2, currentSelection == 2),
                    SizedBox(height: 10,),
                    _choice(Colors.lightBlue, 3,currentSelection == 3),
                    SizedBox(height: 10,),
                    _choice(Colors.yellow, 4, currentSelection == 4),
                  ],
                )
              ),
            ],
          );
        },
    );
  }

  Widget _choice(Color color, int index, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentSelection = index;
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: selected ? Center(
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
          ),
        ) : null,
      ),
    );
  }
}

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Placeholder(),
    );
  }
}
class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Placeholder(),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Placeholder(),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Footer")
      ],
    );
  }
}
