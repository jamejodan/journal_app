import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                child: Center(
                  child: Image.asset(
                    'images/two.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    color: Color(0xff2B7279),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "Wai Yan",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Text(
                          'Yangon,Myanmar',
                          style: TextStyle(color: Colors.white54),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: new EdgeInsets.only(left: 40),
                          width: double.infinity,
                          child: Text(
                            "Settings",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(left: 40, top: 30),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.globe,
                                color: Colors.white,
                              ),
                              Container(
                                  margin: new EdgeInsets.only(left: 10),
                                  child: Text("Languages",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))),
                              Container(
                                  margin: new EdgeInsets.only(left: 130),
                                  child: Text("English",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff67A9A9),
                                ),
                                margin: new EdgeInsets.only(left: 10),
                                padding: new EdgeInsets.all(5),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(left: 40, top: 30),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.globe,
                                color: Colors.white,
                              ),
                              Container(
                                  margin: new EdgeInsets.only(left: 10),
                                  child: Text("Notificationr",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))),
                              Container(
                                  margin: new EdgeInsets.only(left: 130),
                                  child: Text("English",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff67A9A9),
                                ),
                                margin: new EdgeInsets.only(left: 10),
                                padding: new EdgeInsets.all(5),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(left: 40, top: 30),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.globe,
                                color: Colors.white,
                              ),
                              Container(
                                  margin: new EdgeInsets.only(left: 10),
                                  child: Text("Languages",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))),
                              Container(
                                  margin: new EdgeInsets.only(left: 130),
                                  child: Text("English",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff67A9A9),
                                ),
                                margin: new EdgeInsets.only(left: 10),
                                padding: new EdgeInsets.all(5),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),

          // Profile image
          Positioned(
            top: 150.0, //(background container size) - (circle height / 2)
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('images/one.jpg')),
            ),
          ),
          Positioned(
            top: 200,
            left: 350,
            child: Container(
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {
                  //AutoRouter.of(context).push(EditProfileRoute());
                },
                icon: FaIcon(
                  FontAwesomeIcons.edit,
                  size: 20,
                ),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
