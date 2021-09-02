import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:journal_app/database/data.dart';
import 'package:journal_app/database/notedao.dart';

class HomeWidget extends StatelessWidget {
  final NoteDao noteDao = Get.find();

  IconData getEmoji(int? selectIndex) {
    if (selectIndex == 0) {
      return Icons.emoji_emotions;
    } else if (selectIndex == 1) {
      return Icons.verified;
    } else if (selectIndex == 2) {
      return Icons.safety_divider;
    } else {
      return Icons.person;
    }
  }

  IconData getWeather(int? selectedWeather) {
    if (selectedWeather == 0) {
      return Icons.wb_sunny_outlined;
    } else if (selectedWeather == 1) {
      return Icons.wb_cloudy_outlined;
    } else if (selectedWeather == 2) {
      return Icons.wb_shade_outlined;
    } else {
      return Icons.wb_incandescent_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Enter the name whatever u search',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Text(
              'All Entries',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height,
              child: noteList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      stream: noteDao.getAllNotes(),
      builder: (_, data) {
        if (data.hasData) {
          return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (_, positioned) => Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFedd09f),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 160,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 10, top: 13, bottom: 5),
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.data![positioned].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2b7379),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.white60,
                                child: Center(
                                  child: Icon(
                                    getWeather(data.data![positioned].weather),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.white60,
                                child: Center(
                                  child: Icon(
                                    getEmoji(data.data![positioned].emoji),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                data.data![positioned].description,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.date_range_outlined),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      data.data![positioned].dueDate
                                          .substring(0, 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            color: Colors.blueGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //  ListTile(
            //   title: Text(data.data![positioned].title),
            //   subtitle: Text(data.data![positioned].description),
            // ),
          );
        } else {
          return Text('Error');
        }
      },
    );
  }
}
