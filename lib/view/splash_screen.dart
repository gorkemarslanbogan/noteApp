import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:noteapp/product/extension/lottie_extension.dart';
import 'package:noteapp/product/navigator/navigator.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';



class splashScreen extends StatefulWidget {
  const splashScreen({ Key? key }) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    goMainHome();
  }
  Future<void> goMainHome() async {
    await Future.delayed(const Duration(seconds: 4));
    Addnote().fetchItem();
    Navigator.of(context).pushReplacementNamed(navigatorPagename.Home.withParaf);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _lottieWidget(),
    );
  }
}

class _lottieWidget extends StatelessWidget {
  const _lottieWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(lottieFileName.taking_notes.lottiePath));
  }
}