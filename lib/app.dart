import 'core/route/app_route.dart';
import 'feature/login/presentation/screen/export.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     onGenerateRoute: AppRoute.onGenerateRoute,

    );
  }
}

class T extends StatefulWidget {
  const T({super.key});

  @override
  State<T> createState() => _TState();
}

class _TState extends State<T> {
  List<Widget> list = [
    Container(
      width: 100,
      height: 100,
      color: Colors.red,
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.orange,
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> xlist = list.reversed.toList();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return list[index];
              },
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        list.add(
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.green,
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.send))),
          )
        ],
      ),
    );
  }
}
