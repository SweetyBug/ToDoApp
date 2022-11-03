import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List toDoListHeader = [];
  List toDoListBody = [];
  bool _checkState = false;
  late String _userToDo;

  Color getColor(Set<MaterialState> states) => Colors.white;

  @override
  void initState() {
    super.initState();
    toDoListHeader.addAll([]);
    toDoListBody.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('ToDo App'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ))),
      body: GridView.builder(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: toDoListHeader.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ListTile(
                title: Text(toDoListHeader[index]),
                subtitle: Text(toDoListBody[index]),
                trailing: Checkbox(
                    checkColor: Colors.black87,
                    //fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: _checkState,
                    onChanged: (bool? value) {
                      setState(() {
                        _checkState = value!;
                      });
                    }),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить элемент'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toDoListHeader.add('Задача ${toDoListHeader.length}');
                          toDoListBody.add(_userToDo);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text('add'),
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.add, color: Colors.black87,),
      ),
    );
  }
}
