import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DelegateSearch extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  DelegateSearch(List<String> words)
      : _words = words,
        _history = <String>['apple', 'orange', 'banana'],
        super();
  @override
  // TODO: implement searchFieldDecorationTheme
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        labelStyle: GoogleFonts.lato(color: Colors.white),
      );
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => '     Tickle your curiosity.....';
  //https://stackoverflow.com/questions/60013339/change-font-style-of-searchfieldlabel-in-searchdelegate-flutter
  @override
  ThemeData appBarTheme(BuildContext context) {
    final appBarSearchTheme = ThemeData(
      bottomAppBarColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        // textTheme: TextTheme(
        //   // headline1: GoogleFonts.roboto(fontSize: 40),
        //   headline2: GoogleFonts.roboto(fontSize: 40),
        //   headline3: GoogleFonts.roboto(fontSize: 40),
        //   headline4: GoogleFonts.roboto(fontSize: 40),
        //   headline5: GoogleFonts.roboto(fontSize: 40),
        //   headline6: GoogleFonts.roboto(fontSize: 40),
        //   bodyText1: GoogleFonts.roboto(fontSize: 40),
        //   bodyText2: GoogleFonts.roboto(fontSize: 40),
        //   subtitle1: GoogleFonts.roboto(fontSize: 40),
        //   subtitle2: GoogleFonts.roboto(fontSize: 40),
        //   overline: GoogleFonts.roboto(fontSize: 40),
        //   caption: GoogleFonts.roboto(fontSize: 40),
        // ).apply(
        //   bodyColor: Colors.black,
        //   displayColor: Colors.black,
        // ),
      ),
      iconTheme: IconThemeData(
        size: 60,
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
    return appBarSearchTheme;
  }

  // @override
  // // TODO: implement searchFieldDecorationTheme
  // InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
  //       fillColor: Colors.black,
  //       focusColor: Colors.yellow,
  //       hoverColor: Colors.black,
  //       enabledBorder: InputBorder.none,
  //       border: InputBorder.none,
  //       errorBorder: InputBorder.none,
  //       focusedBorder: InputBorder.none,
  //       disabledBorder: InputBorder.none,
  //       focusedErrorBorder: InputBorder.none,
  //     );
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        this.close(context, '');
      },
      icon: AnimatedIcon(
          color: Colors.black,
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('===Your Word Choice==='),
          GestureDetector(
            onTap: () {
              //Just close search and return to old page
              this.close(context, this.query);
            },
            child: Text(
              this.query,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile();
    });
  }
}
