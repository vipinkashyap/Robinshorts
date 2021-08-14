import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:robinnews/services/api/api_client.dart';
import 'package:robinnews/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isChipSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          'Robin News',
          style: GoogleFonts.bebasNeue(
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'RobinFont',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: Future.wait(
            [
              ApiClient().getNews(),
              ApiClient().getNewsSources(),
            ],
          ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data[1]['sources'].length);
              return Column(
                children: [
                  Wrap(
                    children: [
                      ChoiceChip(
                        label: Text(snapshot.data[1]['sources'][0]['name']),
                        selected: _isChipSelected,
                        onSelected: (b) {
                          setState(() {
                            if (b == true) {
                              _isChipSelected = b;
                            } else {
                              _isChipSelected = false;
                            }
                          });
                        },
                      )
                    ],
                  ),
                  ListView.builder(
                    itemCount: snapshot.data[0]['articles'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Utils().launchUrl(
                              snapshot.data[0]['articles'][index]['url']);
                        },
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data[0]['articles'][index]['source']
                                    ['name'],
                                textScaleFactor: 0.8,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data[0]['articles'][index]['title'],
                                textScaleFactor: 1.3,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.network(
                              snapshot.data[0]['articles'][index]['urlToImage'],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey[100],
                              thickness: 0.8,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
