import 'dart:async';
import 'package:flutter/material.dart';

class WebMarquee extends StatefulWidget {
  final String text;
  final TextStyle style;

  const WebMarquee({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  State<WebMarquee> createState() => _WebMarqueeState();
}

class _WebMarqueeState extends State<WebMarquee> {
  double _position = 0.0;
  double _textWidth = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final textPainter = TextPainter(
        text: TextSpan(text: widget.text, style: widget.style),
        maxLines: 1,
        textDirection: TextDirection.ltr,
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
      )..layout();

      _textWidth = textPainter.width;
      _position = MediaQuery.of(context).size.width;
      _startScrolling();
    });
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 35), (timer) {
      if (!mounted) return;
      setState(() {
        _position -= 1.5;
        if (_position < -_textWidth) {
          _position = MediaQuery.of(context).size.width;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20,
      child: Stack(
        children: [
          Positioned(
            left: _position,
            child: Text(widget.text, style: widget.style),
          ),
        ],
      ),
    );
  }
}
