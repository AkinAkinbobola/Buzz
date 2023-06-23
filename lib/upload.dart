import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:buzz/constant.dart';
import 'package:buzz/size_config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  void initState() {
    super.initState();
    SizeConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundCream,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ready to Upload a song?",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4B4B4B),
                foregroundColor: darkOrange,
                elevation: 0,
                minimumSize: Size(getProportionateScreenWidth(256),
                    getProportionateScreenHeight(41)),
              ),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ["mp3", "wav"],
                );
                if (result != null) {
                  PlatformFile file = result.files.first;

                  var data = await uploadRecording(File(file.path!));
                  var decodedData = json.decode(data!);
                  var jsonString = json.encode(decodedData);
                  print(jsonString);
                } else {
                  // User canceled the picker
                }
              },
              child: Text(
                "Upload",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<String?> uploadRecording(File file) async {
  if (file.path != null) {
    Uint8List bytes = await file.readAsBytes();

    final url = Uri.parse('http://10.0.2.2:8000/upload-audio');

    final request = http.MultipartRequest('POST', url);

    request.files.add(await http.MultipartFile.fromBytes(
      'audio',
      bytes,
      filename: "audio.mp3",
    ));

    final response = await request.send();
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Recording uploaded successfully');
        return await response.stream.bytesToString();
      }
    } else {
      if (kDebugMode) {
        print('Failed to upload recording. Error: ${response.reasonPhrase}');
      }
    }
  }
  return null;
}
