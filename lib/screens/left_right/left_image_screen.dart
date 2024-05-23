import 'package:crossplatform10/screens/left_right/right_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LeftImageScreen extends StatefulWidget {
  const LeftImageScreen({super.key});

  @override
  State<LeftImageScreen> createState() => _LeftImageScreenState();
}

class _LeftImageScreenState extends State<LeftImageScreen> {
  String _url = "https://raw.githubusercontent.com/BerestaCoder/Crossplatform-7/main/img/right.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Картинка слева"),
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
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RightImageScreen())),
                child: const Text("Перейти направо"))
          ],
        ),
      )
    );
  }
}