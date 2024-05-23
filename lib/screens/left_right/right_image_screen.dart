import 'package:crossplatform10/screens/left_right/left_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RightImageScreen extends StatefulWidget {
  const RightImageScreen({super.key});

  @override
  State<RightImageScreen> createState() => _RightImageScreenState();
}

class _RightImageScreenState extends State<RightImageScreen> {
  String _url = "https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/left.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Картинка справа"),
      ),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: _url,
              progressIndicatorBuilder: (c, url, p) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LeftImageScreen())),
                child: const Text("Перейти налево"))
          ],
        ),
      )
    );
  }
}