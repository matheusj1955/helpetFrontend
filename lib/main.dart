import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:testando/posts.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
 class MyApp extends StatefulWidget {
   @override
   _MyAppState createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     Future.delayed(
       Duration(seconds: 5),
           () {
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => Posts(),
           ),
         );
       },
     );
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         width: double.infinity,
         height: double.infinity,
         color: Color(0xffa56336),
         child: new Image.asset(
           "images/apresentacao.png",
         ),
       ),
     );
   }
 }


//void _api(){
//  Widget MainHomeWidget(BuildContext context, Future<List<posts>> listEvents) {
//    return FutureBuilder(
//      future: listEvents,
//      builder: (context, projectSnap) {
//
//        //verifica se tem internet
//        if (projectSnap.connectionState == ConnectionState.none) {
//          return Container(
//            child: Text('Não foi possível se conectar à internet!'),
//          );
//        }
//
//        //mostra loading enquanto carrega as coisas
//        if (!projectSnap.hasData) {
//          return Container(
//            color: Colors.black,
//            alignment: Alignment.center,
//            child: Container(
//              width: 60.0,
//              height: 60.0,
//              child: CircularProgressIndicator(
//                backgroundColor: Colors.transparent,
//                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
//              ),
//            ),
//          );
//        }
//
//        //depois que carrega as coisas da api com sucesso, cria o list view
//        return Container(
//          color: Colors.black,
//          child: ListView.builder(
//            itemCount: projectSnap.data?.length ?? 0,
//            itemBuilder: (context, index) {
//              return AnimationConfiguration.staggeredList(
//                position: index,
//                duration: const Duration(milliseconds: 300),
//                child: SlideAnimation(
//                  verticalOffset: 50.0,
//                  child: FadeInAnimation(
//                    child: _getEventList(context, projectSnap.data[index]),
//                  ),
//                ),
//              );
//            },
//          ),
//        );
//      },
//    );
//  }
//}
