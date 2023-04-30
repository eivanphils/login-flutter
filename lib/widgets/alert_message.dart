import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  final String message;
  const AlertMessage(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: const [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          SizedBox(width: 10,),
          Text('Ha ocurrido un error')
        ],
      ),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Entendido'))
      ],
    );
  }
}
