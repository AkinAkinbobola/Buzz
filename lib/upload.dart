// ignore_for_file: non_constant_identifier_names, await_only_futures

import 'dart:convert';
import 'dart:io';

import 'package:buzz/constant.dart';
import 'package:buzz/models/ACRCloudModel.dart';
import 'package:buzz/size_config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/spotify.dart' as SpotifyPack;

import 'display_results.dart';
import 'models/SpotifyAccessTokenModel.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool isLoading = false;
  late AcrCloudModel? acrResponse;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
    SizeConfig();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: backgroundCream,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : SizedBox(
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
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ["mp3", "wav"],
                      );
                      if (result != null) {
                        PlatformFile file = result.files.first;

                        try {
                          var data = await uploadRecording(File(file.path!));
                          setState(() {
                            isLoading = true;
                          });
                          acrResponse =
                              acrCloudModelFromJson(json.decode(data!));
                          var spotify_id = acrResponse?.metadata?.music?[0]
                              .externalMetadata?.spotify?.track?.id;

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisplayResults(
                                      songID: spotify_id!,
                                    )),
                          );
                        } catch (e) {
                          if (kDebugMode) {
                            print(e);
                          }
                        }
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
  Uint8List bytes = await file.readAsBytes();

  final url = Uri.parse('http://10.0.2.2:8000/upload-audio');

  final request = http.MultipartRequest('POST', url);

  request.files.add(await http.MultipartFile.fromBytes(
    'audio',
    bytes,
    filename: "audio.mp3",
  ));

  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Recording uploaded successfully');
      return response.body;
    }
  } else {
    if (kDebugMode) {
      print('Failed to upload recording. Error: ${response.reasonPhrase}');
    }
  }
  return null;
}

Future<String?> getTrack(String? trackID) async {
  var link = Uri.parse('https://api.spotify.com/v1/tracks/$trackID');
  var token = await getToken();
  if (token != null) {
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(link, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

Future<String?> getToken() async {
  var uri = Uri.parse('https://accounts.spotify.com/api/token');
  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  Map<String, String> body = {
    'grant_type': 'client_credentials',
    'client_id': kClientId,
    'client_secret': kClientSecret,
  };

  var response = await http.post(uri, headers: headers, body: body);
  if (response.statusCode == 200) {
    var spotifyAccessToken = spotifyAccessTokenModelFromJson(response.body);
    return spotifyAccessToken.accessToken;
  } else {
    return null;
  }
}
