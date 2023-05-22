import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
                child: SizedBox(
                  height: 45,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search Job',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_icon.png'),
              )
            ],
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/cleaning.png',
                              height: 100,
                              width: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('2hrs',
                                    style: GoogleFonts.pangolin(fontSize: 13)),
                                Text('200/hrs',
                                    style: GoogleFonts.pangolin(fontSize: 13))
                              ],
                            ),
                            Text('Cleaning',
                                style: GoogleFonts.roboto(fontSize: 18)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Pala',
                                    style: GoogleFonts.roboto(fontSize: 16)),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
