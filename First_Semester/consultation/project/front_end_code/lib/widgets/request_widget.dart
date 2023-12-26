import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(148, 255, 193, 7),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
        ),
        title: const Text("Abdelaziz"),
        subtitle: const Text("Match"),
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
