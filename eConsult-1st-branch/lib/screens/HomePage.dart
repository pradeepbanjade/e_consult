import 'package:econsult_new_project/screens/doctor_page.dart';
import 'package:econsult_new_project/screens/covid_home.dart';
//import 'package:econsult_new_project/screens/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // "this is for slider"
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'images/slider/a.png',
    'images/slider/b.jpg',
    'images/slider/c.jpg',
    'images/slider/d.png',
    'images/slider/e.jpg'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xFF473F97),
        appBar: AppBar(
          title: Text('eConsult'),
          backgroundColor: Color(0xFF473F97),
          elevation: 5,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),
        drawer: Drawer(),
        body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              //vertical: 10.0,
            ),
            child: Container(
              // height: 520.0,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              print("printed doctor");
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => DoctorHomepage()));
                            },
                            textColor: Colors.black,
                            color: Colors.lightBlue[800],
                            padding: const EdgeInsets.all(0.0),
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              width: 180,
                              height: 110,
                              decoration: BoxDecoration(
                                //color: Color(0xFF473F97),
                                image: DecorationImage(
                                  image: AssetImage("images/doctoricon.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const Text(
                                'Doctor',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              print("printed hospital");
                            },
                            textColor: Colors.black,
                            color: Colors.lightBlue[800],
                            padding: const EdgeInsets.all(0.0),
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              width: 180,
                              height: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/hospital.png'),
                                ),
                              ),
//                        padding: const EdgeInsets.all(40.0),
                              child: const Text(
                                'Hospital',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            print("prnted covid19");
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => MyApp1()));
                          },
                          textColor: Colors.black,
                          color: Colors.lightBlue,
                          padding: const EdgeInsets.all(0.0),
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: 320,
                            height: 160,
//                      padding: EdgeInsets.all(40.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/covid19.png'),
                              ),
                            ),
                            child: Text(
                              'COVID-19',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),

// joining slider to HomePage

                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        CarouselSlider(
                          height: 180,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          reverse: false,
                          //aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          pauseAutoPlayOnTouch: Duration(seconds: 10),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                          items: imgList.map((imgUrl) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Image.asset(
                                    imgUrl,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(imgList, (index, url) {
                            return Container(
                              width: 10.0,
                              height: 10.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Colors.redAccent
                                    : Colors.green,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ]),
            )));
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
