import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:clothing_app/constants.dart';

class SlidingImage extends StatefulWidget {
  @override
  _SlidingImageState createState() => _SlidingImageState();
}

class _SlidingImageState extends State<SlidingImage> {
  final PageController _controller = PageController();
  Timer? _timer;
  int _currentIndex = 0; // Track current index

  @override
  void initState() {
    super.initState();

    // Auto-slide images every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_controller.hasClients) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % carousel.length;
        });

        _controller.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Stop timer when widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: carousel.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index; // Update current index
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(carousel[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          carousel[index]['text']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            backgroundColor: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Page Indicator
          Padding(
            padding: const EdgeInsets.all(16),
            child: SmoothPageIndicator(
              controller: _controller,
              count: carousel.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.white,
                activeDotColor: Colors.blueAccent,
                dotHeight: 8,
                dotWidth: 8,
              ),
              onDotClicked: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
