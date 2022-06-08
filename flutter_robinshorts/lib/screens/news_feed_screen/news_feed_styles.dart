import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../blocs/blocs.dart';
import 'widgets/widgets.dart';

part 'news_feed_screen.dart';

const Color _kAppBarBackgroundColor = Colors.white;
const Color _kAppBarTitleTextColor = Colors.black;
const Color _kAppBarSearchIconColor = Colors.grey;
const Color _kAppBarCursorColor = Color.fromARGB(255, 0, 200, 5);
const Color _kSearchBoxBackgroundColor = Color.fromARGB(255, 242, 237, 237);
const double _kTitleScaleFactor = 1.6;
