import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';

// Chat Screen class with state
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Salam! How are you?', 'isSender': false, 'time': '11:00 AM', 'type': 'text'},
    {'text': 'Walaikum Salam! i am fine and you?', 'isSender': true, 'time': '11:02 AM', 'type': 'text'},
  ];
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Add new text message
  void _sendMessage(String text) {
    setState(() {
      _messages.add({
        'text': text,
        'isSender': true,
        'time': TimeOfDay.now().format(context),
        'type': 'text',
      });
      // Add dummy response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            'text': 'Theek hai, aur kya chal raha?', // Dummy response
            'isSender': false,
            'time': TimeOfDay.now().format(context),
            'type': 'text',
          });
        });
      });
    });
    _controller.clear();
  }

  // Pick media (image, video, or audio) from gallery
  Future<void> _pickMedia() async {
    final XFile? media = await _picker.pickMedia();
    if (media != null) {
      setState(() {
        if (media.path.endsWith('.mp4') || media.path.endsWith('.mov')) {
          // Video
          _messages.add({
            'videoPath': media.path,
            'isSender': true,
            'time': TimeOfDay.now().format(context),
            'type': 'video',
          });
          // Add dummy response
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _messages.add({
                'text': 'Wow, cool video! 🎥', // Dummy response
                'isSender': false,
                'time': TimeOfDay.now().format(context),
                'type': 'text',
              });
            });
          });
        } else if (media.path.endsWith('.mp3')) {
          // Audio
          _messages.add({
            'audioPath': media.path,
            'isSender': true,
            'time': TimeOfDay.now().format(context),
            'type': 'audio',
          });
          // Add dummy response
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _messages.add({
                'text': 'Nice audio! 🎶', // Dummy response
                'isSender': false,
                'time': TimeOfDay.now().format(context),
                'type': 'text',
              });
            });
          });
        } else {
          // Image
          _messages.add({
            'imagePath': media.path,
            'isSender': true,
            'time': TimeOfDay.now().format(context),
            'type': 'image',
          });
          // Add dummy response
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _messages.add({
                'text': 'Nice pic! 😎', // Dummy response
                'isSender': false,
                'time': TimeOfDay.now().format(context),
                'type': 'text',
              });
            });
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: ChatBody(messages: _messages),
      bottomNavigationBar: ChatInputField(
        controller: _controller,
        onSend: _sendMessage,
        onPickMedia: _pickMedia,
      ),
    );
  }
}

// Custom AppBar class
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: const Text(
        'Chat Screen',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Chat Body class
class ChatBody extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const ChatBody({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        if (message['type'] == 'image') {
          return ImageMessage(
            imagePath: message['imagePath'],
            isSender: message['isSender'],
            time: message['time'],
          );
        } else if (message['type'] == 'video') {
          return VideoMessage(
            videoPath: message['videoPath'],
            isSender: message['isSender'],
            time: message['time'],
          );
        } else if (message['type'] == 'audio') {
          return AudioMessage(
            audioPath: message['audioPath'],
            isSender: message['isSender'],
            time: message['time'],
          );
        } else {
          return BubbleMessage(
            text: message['text'],
            isSender: message['isSender'],
            time: message['time'],
          );
        }
      },
    );
  }
}

// Bubble Message class for text
class BubbleMessage extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;

  const BubbleMessage({
    super.key,
    required this.text,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          BubbleSpecialThree(
            text: text,
            isSender: isSender,
            color: isSender ? Colors.blueAccent : Colors.grey[300]!,
            tail: true,
            textStyle: TextStyle(
              color: isSender ? Colors.white : Colors.black,
              fontSize: 16,
            ),
            sent: isSender,
            delivered: isSender,
            seen: isSender,
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// Image Message class
class ImageMessage extends StatelessWidget {
  final String imagePath;
  final bool isSender;
  final String time;

  const ImageMessage({
    super.key,
    required this.imagePath,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isSender ? Colors.blueAccent : Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(imagePath),
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// Video Message class
class VideoMessage extends StatefulWidget {
  final String videoPath;
  final bool isSender;
  final String time;

  const VideoMessage({
    super.key,
    required this.videoPath,
    required this.isSender,
    required this.time,
  });

  @override
  _VideoMessageState createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: widget.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.isSender ? Colors.blueAccent : Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _isInitialized
                  ? Stack(
                children: [
                  VideoPlayer(_controller),
                  Center(
                    child: IconButton(
                      icon: Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                    ),
                  ),
                ],
              )
                  : const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// Audio Message class
class AudioMessage extends StatefulWidget {
  final String audioPath;
  final bool isSender;
  final String time;

  const AudioMessage({
    super.key,
    required this.audioPath,
    required this.isSender,
    required this.time,
  });

  @override
  _AudioMessageState createState() => _AudioMessageState();
}

class _AudioMessageState extends State<AudioMessage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setFilePath(widget.audioPath);
    _audioPlayer.durationStream.listen((d) {
      setState(() {
        _duration = d ?? Duration.zero;
      });
    });
    _audioPlayer.positionStream.listen((p) {
      setState(() {
        _position = p;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: widget.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.isSender ? Colors.blueAccent : Colors.grey[300],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: widget.isSender ? Colors.white : Colors.black,
                  ),
                  onPressed: () async {
                    if (_isPlaying) {
                      await _audioPlayer.pause();
                      setState(() {
                        _isPlaying = false;
                      });
                    } else {
                      await _audioPlayer.play();
                      setState(() {
                        _isPlaying = true;
                      });
                    }
                  },
                ),
                Expanded(
                  child: Slider(
                    value: _position.inSeconds.toDouble(),
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (value) async {
                      await _audioPlayer.seek(Duration(seconds: value.toInt()));
                    },
                    activeColor: widget.isSender ? Colors.white : Colors.blueAccent,
                    inactiveColor: widget.isSender ? Colors.white54 : Colors.grey,
                  ),
                ),
                Text(
                  '${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: widget.isSender ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// Chat Input Field class
class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSend;
  final VoidCallback onPickMedia;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onPickMedia,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.blueAccent),
            onPressed: onPickMedia,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onSubmitted: onSend,
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blueAccent,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  onSend(controller.text.trim());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}