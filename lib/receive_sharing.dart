import 'dart:io';

import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:test_receive_sharing/main.dart';

class ReceiveSharingPage extends StatelessWidget {
  const ReceiveSharingPage({
    super.key,
    required this.extra,
  });

  final SharedExtra extra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Sharing'),
      ),
      body: Column(
        children: [
          if (extra.file.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: extra.file.length,
                itemBuilder: (context, index) {
                  final file = extra.file[index];
                  if (file.type == SharedMediaType.IMAGE) {
                    return Image.file(
                      File(file.path),
                      fit: BoxFit.cover,
                    );
                  }
                  if (file.type == SharedMediaType.VIDEO) {
                    return Image.file(
                      File(file.thumbnail ?? ''),
                      fit: BoxFit.cover,
                    );
                  }
                  return Text(file.path);
                },
              ),
            ),
          if (extra.text != null)
            Expanded(
              child: Center(
                child: Text(extra.text!),
              ),
            ),
        ],
      ),
    );
  }
}
