import 'package:flutter/material.dart';
import 'package:journal_app/database/data.dart';
import 'package:journal_app/database/notedao.dart';

class HomePage extends StatelessWidget {
  final cardTitle = ['History', 'Travel', 'Diary'];

  final NoteDao noteDao;

  HomePage(this.noteDao);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2b7279),
        body: noteList(),
        // body: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding:
        //             EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(30),
        //             color: Colors.white,
        //           ),
        //           width: MediaQuery.of(context).size.width,
        //           height: MediaQuery.of(context).size.height * 0.07,
        //           child: Center(
        //             child: Padding(
        //               padding: const EdgeInsets.only(left: 16),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   Icon(Icons.search),
        //                   SizedBox(
        //                     width: 10,
        //                   ),
        //                   Text('Enter the name whatever you search'),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         height: 260,
        //         child: ListView.builder(
        //           itemCount: 3,
        //           scrollDirection: Axis.horizontal,
        //           itemBuilder: (_, index) => Padding(
        //             padding:
        //                 const EdgeInsets.only(left: 20, top: 10, right: 10),
        //             child: Column(
        //               children: [
        //                 _EntryCard(
        //                   image: '',
        //                   title: '${cardTitle[index]}',
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.all(20),
        //         child: Text(
        //           'All Entries',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 19,
        //               fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 15, right: 15),
        //         child: Container(
        //           height: MediaQuery.of(context).size.height,
        //           child: ListView.builder(
        //               itemCount: 5,
        //               scrollDirection: Axis.vertical,
        //               itemBuilder: (_, index) => Padding(
        //                     padding: const EdgeInsets.all(5),
        //                     child: Container(
        //                         height: 150,
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Padding(
        //                               padding: const EdgeInsets.only(
        //                                   top: 20, left: 0, right: 10),
        //                               child: Container(
        //                                 height: 120,
        //                                 width: 96,
        //                                 color: Color(0xFFedd09f),
        //                               ),
        //                             ),
        //                             Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(
        //                                       left: 10, top: 36),
        //                                   child: Text(
        //                                     'All Days Hiking',
        //                                     style: TextStyle(
        //                                         color: Colors.white,
        //                                         fontSize: 17,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(
        //                                       left: 10, top: 8),
        //                                   child: Text(
        //                                     'All Days Hiking',
        //                                     style: TextStyle(
        //                                         color: Colors.white,
        //                                         fontSize: 14),
        //                                   ),
        //                                 ),
        //                                 Row(
        //                                   children: [
        //                                     Padding(
        //                                       padding: const EdgeInsets.only(
        //                                           top: 30, left: 8, right: 5),
        //                                       child: Icon(
        //                                         Icons.timer,
        //                                         color: Colors.white,
        //                                       ),
        //                                     ),
        //                                     Padding(
        //                                       padding: const EdgeInsets.only(
        //                                           top: 34),
        //                                       child: Text(
        //                                         '12:20',
        //                                         style: TextStyle(
        //                                             color: Colors.white,
        //                                             fontWeight:
        //                                                 FontWeight.w500),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ],
        //                             ),
        //                           ],
        //                         )),
        //                   )),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            noteDao.addNote(
              Note(title: 'This is title', description: 'This is description'),
            );
          },
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
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
            itemBuilder: (_, positioned) => ListTile(
              title: Text(data.data![positioned].title),
              subtitle: Text(data.data![positioned].description),
            ),
          );
        } else {
          return Text('Error');
        }
      },
    );
  }
}

// class _EntryCard extends StatelessWidget {
//   final String image;
//   final String title;

//   _EntryCard({required this.image, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 150,
//           height: 200,
//           color: Color(0xFFdff0f1),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           title,
//           style: TextStyle(color: Colors.white),
//         ),
//       ],
//     );
//   }
// }
