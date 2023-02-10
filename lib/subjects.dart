import 'package:flutter/material.dart';
import 'package:healthysex/launch_screen.dart';
import 'package:healthysex/lists_constants.dart';


class Subjects extends StatefulWidget {
  Subjects({Key key}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  int _selectedIndex; // if you want to provide default selection, init here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.03),
            child: SizedBox(
                width: MediaQuery.of(context).size.width, // play with height
                height:
                    MediaQuery.of(context).size.width * 0.450, // play with height
                child: GridView.builder(
                  itemCount: TITLES.length,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LaunchScreen(index)));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 800,
                            height: 200,
                            // play with height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: _selectedIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                            child: Card(
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Image.asset(
                                      IMAGES.elementAt(index),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(TITLES.elementAt(index),
                                            style: const TextStyle(
                                                color: Colors.pink,
                                                fontSize: 24,
                                                overflow: TextOverflow.fade,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (1),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
