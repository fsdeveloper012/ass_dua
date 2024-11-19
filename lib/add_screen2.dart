import 'package:aas/Screens/BottomNavScreens/Reels%20Screen/content_screen.dart';
import 'package:aas/Screens/BottomNavScreens/Reels%20Screen/reels_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import 'Screens/BottomNavScreens/Reels Screen/custom_search.dart';



class AddScreen2 extends StatefulWidget {

  @override
  State<AddScreen2> createState() => _AddScreen2State();
}

class _AddScreen2State extends State<AddScreen2> {
  int _currentIndex = 0;
  int _selectedTab = 0;


  final List<String> videos = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://rr8---sn-2uja-3ip6.googlevideo.com/videoplayback?expire=1695224494&ei=Tr4KZfqgOJSP_9EP_5uxaA&ip=54.157.37.254&id=o-AEdUQMhzLaysJ5fub28mUYTRJy2jMkLUUIna0yOZttc7&itag=18&source=youtube&requiressl=yes&spc=UWF9fw88U0tTnAMYr7_p-axSEWCBNbU&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=2992326&ratebypass=yes&dur=70.727&lmt=1389441429002214&fexp=24007246&c=ANDROID&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgeDXUMKBBm5JLQUqhGcwQH7GxxvcTKAbUOnlFcyABgrACIQDbMWR8tuOutfZJ8RCtpTVm2AQdrJxsXXCU7ln6gJ_3aQ%3D%3D&title=1%20minute%20introduction%20to%20islam&redirect_counter=1&rm=sn-p5qe7k7s&req_id=82ba6eb1000ca3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=Zg&mip=154.192.178.39&mm=31&mn=sn-2uja-3ip6&ms=au&mt=1695201346&mv=u&mvi=8&pcm2cms=yes&pl=20&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AG3C_xAwRgIhAKY_6pZq3gdpzu1gNfEI_FrzzMPxD01mrpEvI6mW9SbVAiEAz4hJa8FPX4KqZpquTp0XvZNz0KTosbmbYSJNnVykXu0%3D',
    'https://assets.mixkit.co/videos/preview/mixkit-man-reading-coral-inside-a-mosque-34208-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-anciana-rezando-el-cor%C3%A1n-con-un-rosario-12534-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-3d-animation-of-a-quran-near-a-temple-35194-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-quran-3d-animation-concept-35291-large.mp4'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(

          children: [

            _buildTabText("Following", 0),

            _buildTabText("Trending", 1),
            SizedBox(width: 70),
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 27,
              ),
            )

          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,


        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.black,
                    child: ContentScreen(
                      src: videos[index],
                    ),
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),


            ],
          ),
        ),
      ),

    );
  }
  Widget _buildTabText(String text, int tabIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabIndex;
          if (tabIndex == 0) {
            Get.to(() => AddScreen2());
          } else if (tabIndex == 1) {
            Get.to(() => AddScreen());
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 40),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: _selectedTab == tabIndex ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}

