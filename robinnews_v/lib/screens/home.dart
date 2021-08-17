import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:robinnews_v/services/search/delegate.dart';
import 'package:robinnews_v/widgets/top_headlines.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.085,
        ),
        child: AppBar(
          leadingWidth: MediaQuery.of(context).size.width * 0.15,
          leading: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<ContinuousRectangleBorder>(
                  ContinuousRectangleBorder()),
              backgroundColor: MaterialStateProperty.all(
                Colors.greenAccent,
              ),
              foregroundColor: MaterialStateProperty.all(
                Colors.black,
              ),
            ),
            onPressed: () {},
            child: Text(
              'ROBIN NEWS',
              textScaleFactor: 1.5,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: InkWell(
            onTap: () {
              showSearch(
                context: context,
                delegate: DelegateSearch(
                  ['dog', 'cat'],
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.greenAccent,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search_sharp),
              onPressed: null,
            )
          ],
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(
          20.0,
        ),
        child: FutureHeadlines(),
      ),
    );
  }
}
