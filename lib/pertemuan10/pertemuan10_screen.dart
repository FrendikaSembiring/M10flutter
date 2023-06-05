import 'dart:html';

import 'package:flutter/material.dart';

class Pertemuan10Screen extends StatefulWidget {
  const Pertemuan10Screen({Key? key}) : super(key: key);

  @override
  State<Pertemuan10Screen> createState() => _Pertemuan10ScreenState();
}

class _Pertemuan10ScreenState extends State<Pertemuan10Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 16),
        MaterialBanner(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Banner',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Text.')
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => ScaffoldMessenger.of(context)
            ..removeCurrentMaterialBanner()
            ..showMaterialBanner(showBanner(context)),
            child: const Text('Show Banner'))
          ],
        ),
        MaterialBanner(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Dialog', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Text')
            ]),
          actions: [
            TextButton(
              onPressed: () => showDialog(
                context:context,
                builder: (context) => showSimpleDialog(context)),
                child: const Text('Alert Dialog')),
            TextButton(
              onPressed: () => showDialog(
                context:context,
                builder: (context) => showSimpleDialog(context)),
                child: const Text('Simple Dialog')),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: ((context) => FullScreenDialog()))),
              child: const Text('full')
                )
          ],
        )
      ]),
    );
  }
showBanner(BuildContext context) {
  return MaterialBanner(
    content: const Text('Welcome habibi to dubai'),
    leading: const Icon(
      Icons.info,
      color: Colors.orange,
    ),
    actions: [
      TextButton(onPressed: () {}, child: const Text('Agree')),
      TextButton(
        onPressed: () =>
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text('Dismiss'))
    ]);
}
showAlertDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Reset setting'),
    content: const Text('Ho`ho dore dore.'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('CANCEL'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('ACCEPT'),
      ),
    ],
  );
}
showSimpleDialog(BuildContext context) {
  return SimpleDialog(
    title: const Text('Set backup account'),
    children: List.generate(4, ((index) {
      return SimpleDialogOption(
        onPressed: () => Navigator.pop(context, 'mail$index@mail.com'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.abc, size: 36.0, color: Colors.amber),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0),
              child: Text('Username$index'),
            )
          ],
        ),
      );
    })),
  );
}
}