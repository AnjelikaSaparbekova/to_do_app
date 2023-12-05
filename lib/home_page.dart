import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List todoList = [];
  String singlevalue = "";

  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"value": singlevalue});
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.blue[900],
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 80,
                                    child: Text(
                                      todoList[index]['value'].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Expanded(
                                    flex: 20,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: TextButton(
                                        onPressed: () {
                                          deleteItem(index);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: Container(
                        height: 40,
                        child: TextField(
                          onChanged: (content) {
                            addString(content);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: Colors.blue[300],
                              filled: true,
                              labelText: "Great Task...",
                              labelStyle: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: 5,
                      ),
                    ),
                    Expanded(
                      flex: 27,
                      child: ElevatedButton(
                        onPressed: () {
                          addList();
                        },
                        child: Container(
                          height: 15,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text("Add"),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
