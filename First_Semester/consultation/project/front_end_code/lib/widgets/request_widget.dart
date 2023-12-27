import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {
   RequestWidget({super.key, required this.title, this.name});
  final title;
  var name; 
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(148, 255, 193, 7),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
        ),
        title: const Text("Abdelaziz"),
        subtitle: Text(title),
        trailing: ElevatedButton(
          child: const Text('Approve'),
          onPressed: () {
            // accept the request
          },
        ),
        // trailing: Row(children: [
        //   ElevatedButton(
        //       onPressed: () {
        //         // approve
        //       },
        //       child: Text("Approve")),
        //   TextButton(onPressed: () {}, child: Text("Reject"))
        // ]),
      ),
    );
  }
}
