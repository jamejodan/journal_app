import 'dart:io';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:journal_app/database/data.dart';
import 'package:journal_app/database/notedao.dart';

class AddNewItem extends StatefulWidget {
  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  var selectedDate = DateTime.now();
  int selectedIndex = 1;
  File? _image;
  final picker = ImagePicker();

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();

    //
    //pikerDate = DateTime.now();
    String getText() {
      if (selectedDate != null) {
        return '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}';
      } else {
        return 'Selected Date';
      }
    }

    List<IconData> emoList = [
      Icons.emoji_emotions,
      Icons.ac_unit,
      Icons.baby_changing_station,
      Icons.cabin,
    ];

    return Scaffold(
      backgroundColor: Color(0xFF2b7279),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => datePicker(context),
                      child: Row(
                        children: [
                          Text(
                            getText(), // '${selectedDate.toString()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  //padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    itemCount: emoList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(
                                width: 0.5,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          // child: Text('${emoList[index]}'),
                          child: Icon(emoList[index],
                              color: selectedIndex == index
                                  ? Color(0xFf2b7379)
                                  : Colors.grey[400]),

                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 30),
                child: Text(
                  'Title',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter the title name...',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Color(0xFFedd09f),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  'Story',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15),
                child: TextField(
                  controller: descriptioncontroller,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'What about your today',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.grey[200]),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(),
                  Container(
                    width: 80,
                    color: Colors.white,
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF2b7379),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      noteDao.addNote(
                        Note(
                          title: titlecontroller.text,
                          description: descriptioncontroller.text,
                          photo: '',
                          emoji: selectedIndex,
                          weather: 1,
                          dueDate: selectedDate.toString(),
                        ),
                      );
                    },
                    child: Container(
                      width: 80,
                      margin: EdgeInsets.only(right: 15, left: 10),
                      color: Color(0xFFedd09f),
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Color(0xFF2b7379),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _buildFile() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image as File;
  //   });
  // }

  Future datePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (date != null && date != selectedDate) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
