import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:globalization_sample/common/Global.dart';
import 'package:globalization_sample/generated/l10n.dart';
import 'package:globalization_sample/models/LocalModel.dart';
import 'package:provider/provider.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: LocalModel())
    ],
        child: Consumer<LocalModel>(builder: (context, localModel, child) {
          return MaterialApp(
              locale: localModel.getLocal(),
              onGenerateTitle: (context){
                return S.of(context).title;
              },
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              home: HomePage()
          );
        }));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    LocalModel localModel = Provider.of<LocalModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(child: Column(children: [
        ElevatedButton(onPressed: () {
          localModel.local = 'zh_CN';
        }, child: const Text('简体中文')),
        ElevatedButton(onPressed: () {
          localModel.local = 'en_US';
        }, child: const Text('英语'))

      ],),),
    );
  }
}




