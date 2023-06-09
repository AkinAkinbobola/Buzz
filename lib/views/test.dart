import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrcloud/flutter_acrcloud.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  ACRCloudResponseMusicItem? music;

  @override
  void initState() {
    super.initState();
    ACRCloud.setUp(ACRCloudConfig(
        'dccaf0c06d15eb512eab05a5f9f5420a',
        'cEXwp8kHkjROtLkKWAmDYmJMJgARP9FCylZMOFy4',
        'identify-us-west-2.acrcloud.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  setState(() {
                    music = null;
                  });

                  bool ggg = ACRCloud.isSetUp;
                  print(ggg);
                  final session = ACRCloud.startSession();

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: Text('Listening...'),
                      content: StreamBuilder(
                        stream: session.volumeStream,
                        initialData: 0,
                        builder: (_, snapshot) =>
                            Text(snapshot.data.toString()),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: session.cancel,
                        )
                      ],
                    ),
                  );

                  final result = await session.result;
                  Navigator.pop(context);

                  if (result == null) {
                    // Cancelled.
                    return;
                  } else if (result.metadata == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('No result.'),
                    ));
                    return;
                  }

                  setState(() {
                    music = result.metadata!.music.first;
                  });
                },
                child: Text('Listen'),
              ),
            ),
            if (music != null) ...[
              Text('Track: ${music!.title}\n'),
              Text('Album: ${music!.album.name}\n'),
              Text('Artist: ${music!.artists.first.name}\n'),
            ],
          ],
        ),
      ),
    );
  }
}
