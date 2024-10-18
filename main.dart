//memasukkan package yang dibuituhkan aplikasi
import 'package:english_words/english_words.dart'; 
//paket bahasa inggris
import 'package:flutter/material.dart'; 
//paket untuk tampilan UI (material)
import 'package:provider/provider.dart';
//paket untuk interaksi aplikasi

void main() {
  runApp(MyApp());
}

//membuat abstrak aplikasi dari StatelessWidget (template aplikasi), aplikasi nya bernama MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key}); //menunjukkan bahwa aplikasi ini akan tetap,tidak berubah setelah di build

  @override //mengganti nilai nama yang sudah ada di template,dengan nilai nilai yang baru (replace / overwrite)
  Widget build(BuildContext context) {
    //funsi build adalah fungsi yg membangun UI (mengatur posisi widget, dst)
    //ChangeNotifierProfider mendengarkan/mendektesi semua interaksi yg terjadi di aplikasi
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp( //pada state ini, menggunakan style desain MaterialUI
        title: 'Namer App', // diberi judul Namer App
        theme: ThemeData( // data tema aplikasi, diberi warna deepOrange
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(), //nama halaman "MyHomePage" yang menggunakan states 'MyHomePage'
      ),
    );
  }
}
//mendefinisikan myAppState
class MyAppState extends ChangeNotifier {
  //state MyAppState diisi dengan 2 kata random yang di gabung.Kata random tsb diismpan dalam variable Wordpair
  var current = WordPair.random();
}

// ...

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {           // ← 1
    var appState = context.watch<MyAppState>();  // ← 2

    return Scaffold(                             // ← 3
      body: Column(                              // ← 4
        children: [
          Text('A random AWESOME idea:'),        // ← 5
          Text(appState.current.asLowerCase),    // ← 6
          ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            child: Text('Next'),
          ),
        ],                                       // ← 7
      ),
    );
  }
}

// ...