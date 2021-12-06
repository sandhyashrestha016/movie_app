// ignore_for_file: avoid_renaming_method_parameters, unused_local_variable

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_darklight/models/Movie_Model.dart';
import 'package:movie_darklight/provider/provider.dart';

class Title1 extends ConsumerWidget {
  const Title1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final movieType = watch(movieTypeProvider).state;
    return Text("${movieType.name} movies");
  }
}
