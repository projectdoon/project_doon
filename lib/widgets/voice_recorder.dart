import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecorderButton extends StatefulWidget {
  const VoiceRecorderButton({super.key});

  @override
  State<VoiceRecorderButton> createState() => _VoiceRecorderButtonState();
}

class _VoiceRecorderButtonState extends State<VoiceRecorderButton> {
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  bool isRecording = false;
  bool isPlaying = false;
  String? recordingPath;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    initRecorder();
  }

  Future<void> initRecorder() async {
    await _recorder!.openRecorder();
    await _player!.openPlayer();
  }

  Future<void> startRecording() async {
    var status = await Permission.microphone.request();

    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('permission required '),
        ),
      );
      return;
    }

    Directory tempDir = await getTemporaryDirectory();
    recordingPath = "${tempDir.path}temp_audio.aac";

    await _recorder!.startRecorder(toFile: recordingPath!);
    setState(() {
      isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    await _recorder!.stopRecorder();
    setState(() {
      isRecording = false;
    });
  }

  Future<void> playRecording() async {
    if (recordingPath == null || !File(recordingPath!).existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No Recording Available'),
        ),
      );
      return;
    }

    if (_player!.isPlaying) {
      await _player!.stopPlayer();
      setState(() {
        isPlaying = false;
      });
    } else {
      await _player!.startPlayer(
        fromURI: recordingPath!,
        whenFinished: () {
          setState(
            () {
              isPlaying = false;
            },
          );
        },
      );
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _player!.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        await startRecording();
      },
      onLongPressUp: () async {
        await stopRecording();
      },

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(142, 110),
          backgroundColor: const Color.fromARGB(255, 24, 118, 210),
          elevation: 2.0, // Button shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
        ),
        onPressed: ()async {
          await playRecording();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isRecording
                  ? Icons.mic
                  : (recordingPath == null ||
                          !File(recordingPath!).existsSync())
                      ? Icons.mic
                      : isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
              color: isRecording ? Colors.red : Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              isRecording
                  ? "Recording..."
                  : (recordingPath == null ||
                          !File(recordingPath!).existsSync())
                      ? "Hold to Record"
                      : isPlaying
                          ? "Playing..."
                          : "Press to Play",
              textAlign: TextAlign.center, // Align text properly
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
