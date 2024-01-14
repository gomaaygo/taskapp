import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text('Tarefas'),
        ),
        body: ListView(
          children: [
            Task('Aprendendo Flutter', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 1),
            Task('Andar de Bike', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 2),
            Task('Meditar', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
            Task('Estudar', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),
            Task('Jogar videogame', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
            Task('Desenhar', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 1)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;
  const Task(this.name, this.photo, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26
                        ),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(widget.photo,
                          fit: BoxFit.cover,),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180,
                            child: Text(
                              widget.name,
                              style: TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 15, color: (widget.difficulty >= 1) ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: (widget.difficulty >= 2) ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: (widget.difficulty >= 3) ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: (widget.difficulty >= 4) ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: (widget.difficulty >= 5) ? Colors.blue : Colors.blue[100])
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          child: Column(
                            children: [
                              Icon(Icons.arrow_drop_up, size: 30),
                              Text('UP'),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white, minimumSize: Size(2, 50),),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.difficulty > 0) ? (level/widget.difficulty) / 10 : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nível $level', style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
