// ignore_for_file: await_only_futures

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:http/http.dart' as http;

class Recorder extends StatefulWidget {
  const Recorder({Key? key}) : super(key: key);

  @override
  State<Recorder> createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  bool isRecording = false;
  String? filePath;

  Future<void> startRecording() async {
    final appDir = await getApplicationDocumentsDirectory();
    filePath = '${appDir.path}/audio.mp3';

    await RecordMp3.instance.start(filePath!, (type) {});

    setState(() {
      isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    await RecordMp3.instance.stop();

    setState(() {
      isRecording = false;
    });

    uploadRecording();
  }

  Future<void> uploadRecording() async {
    if (filePath != null) {
      Uint8List file = await File(filePath!).readAsBytes();
      final url = Uri.parse('http://10.0.2.2:8000/upload-audio');
      final request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromBytes('audio', file,
          filename: 'audio.mp3'));

      final response = await request.send();

      if (response.statusCode == 201) {
        if (kDebugMode) {
          print('Recording uploaded successfully');
        }
      } else {
        if (kDebugMode) {
          print('Failed to upload recording. Error: ${response.reasonPhrase}');
        }
      }
    }
  }

  @override
  void dispose() {
    RecordMp3.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (isRecording) {
                  await stopRecording();
                } else {
                  await startRecording();
                }
              },
              child: Text(isRecording ? 'Stop' : 'Record'),
            ),
          ),
        ],
      ),
    );
  }
}
