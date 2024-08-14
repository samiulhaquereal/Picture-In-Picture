import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';

class PIPScreen extends StatefulWidget {
  const PIPScreen({super.key});

  @override
  State<PIPScreen> createState() => _PIPScreenState();
}

class _PIPScreenState extends State<PIPScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('PIP View'),
      ),
      body: HomeScreen(),
    ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PIPView(builder: (context, isFloating) {
      return Scaffold(
        resizeToAvoidBottomInset: !isFloating,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Text('This is the PIP Window'),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(onPressed: (){
                    PIPView.of(context)?.presentBelow(BackgroundScreen());
                  }, child: Text('PIP Mode'))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('THis is Background Screen'),),
      ),
    ));
  }
}
