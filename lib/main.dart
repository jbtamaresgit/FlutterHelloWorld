import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new  Text('Hello Cool World', style:TextStyle(fontWeight: FontWeight.bold)),
              new  RandomWords(),
              new  ListRandomWords(),
            ],
          ),
        ),
      )
    );
  }
}

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return new Container(
      margin: const EdgeInsets.only(top: 50),
      child: Text(wordPair.asUpperCase, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)) ,);
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class ListRandomWords extends StatefulWidget{
  @override
  ListRandomWordsState createState() => new ListRandomWordsState();
}

class ListRandomWordsState extends State<ListRandomWords>{
@override
Widget build(BuildContext context){
  return buildSuggestions();
}

  final suggestions = <WordPair>[];
  final wordStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
  Widget buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd) return Divider();

        final index = i ~/ 2;
        if(index >= suggestions.length){
          suggestions.addAll(generateWordPairs().take(10)); //Generate word pairs from english_words package
        }

        return buildRow(suggestions[index]);
      },
    );
  }

  Widget buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asPascalCase,
      style: wordStyle,),
    );
  }
}
