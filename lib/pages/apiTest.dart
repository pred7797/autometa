import 'package:autom/services/api.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  var nameController = TextEditingController();
  var regNumController = TextEditingController();
  var yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: regNumController,
              decoration:
                  const InputDecoration(hintText: "Registeration number"),
            ),
            TextField(
              controller: yearController,
              decoration: const InputDecoration(hintText: "Current year"),
            ),
            ElevatedButton(
                onPressed: () {
                  var data = {
                    "sname": nameController.text,
                    "class": yearController.text,
                    "regNum": regNumController.text
                  };

                  Api.addStudent(data);
                },
                child: const Text("send data"))
          ],
        ),
      ),
    );
  }
}
