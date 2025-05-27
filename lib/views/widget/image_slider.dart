import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/fetch_img.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late Future<List<Map<String, dynamic>>> _bannerFuture;
  late PageController _pageController;
  Timer? _timer;
  Duration _duration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadBannerData();
  }

  void _loadBannerData() {
    _bannerFuture = FetchImages().fetchBannerData();
  }

  void _startAutoPlay(int imageCount) {
    _timer?.cancel();
    _timer = Timer.periodic(_duration, (Timer timer) {
      if (imageCount <= 0) return;
      int nextPage = _pageController.page!.toInt() + 1;
      _pageController.animateToPage(
        nextPage % imageCount,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _bannerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return _buildFallbackCarousel();
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _startAutoPlay(snapshot.data!.length);
          });
          return _buildImageCarousel(snapshot.data!);
        }
      },
    );
  }

  Widget _buildFallbackCarousel() {
    return _buildCarousel(['assets/images/offerBanner.png']);
  }

  Widget _buildImageCarousel(List<Map<String, dynamic>> banners) {
    return Container(
      height: 160.0,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          final imageUrl = banner['image_url'];
          final title = banner['title'] ?? '';
          final subtitle = banner['sub_title'] ?? '';

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15)),
                SizedBox(height: 2.h),
                Container(
                  width: 200.w,
                  child: Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCarousel(List<String> imgList) {
    return Container(
      height: 160.0,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imgList.length,
        onPageChanged: (index) {
          // Update current page index when user manually scrolls
        },
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: imgList[index].startsWith('http')
                      ? NetworkImage(imgList[index])
                      : AssetImage(imgList[index]),
                  fit: BoxFit.cover,
                )),
          );
        },
      ),
    );
  }
}
