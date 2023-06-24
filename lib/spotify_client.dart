import 'package:http/http.dart' as http;

import 'constant.dart';
import 'models/SpotifyAccessTokenModel.dart';

abstract class SpotifyClient {
  static Future<String?> getArtists(String? artistID) async {
    var link = Uri.parse('https://api.spotify.com/v1/artists/$artistID');
    var token = await getToken();

    if (token != null) {
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      var response = await http.get(link, headers: headers);

      if (response.statusCode == 200) {
        // return SpotifyArtistModel.fromJson(json.decode(response.body));
        return response.body;
      } else {
        throw Exception(
            'Failed to get artist data. Status code: ${response.statusCode}');
      }
    } else {
      throw Exception('Invalid token.');
    }
  }

  static Future<String?> getTrack(String? trackID) async {
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

  static Future<String?> getToken() async {
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
}
