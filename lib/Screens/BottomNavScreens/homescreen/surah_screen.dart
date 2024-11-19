import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SuraScreen extends StatefulWidget {
  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  final List<String> surah = [
    'Alif laam meem',
    'Sayaqula',
    'Tilka r Rusulu',
    'Wal Mohsanat',
    'La Yahubbullah'
        'Wa lza Samiu',
    'Wa LauAnnana'
        'Alif laam meem',
    'Sayaqula',
    'Tilka r Rusulu',
    'Wal Mohsanat',
    'La Yahubbullah'
        'Wa lza Samiu',
    'Wa LauAnnana'
        'Alif laam meem',
    'Sayaqula',
    'Tilka r Rusulu',
    'Wal Mohsanat',
    'La Yahubbullah'
        'Wa lza Samiu',
    'Wa LauAnnana'
  ];
  final List<String> para = [
    'Para 1',
    'Para 2',
    'Para 3',
    'Para 4',
    'Para 5',
    'Para 6',
    'Para 1',
    'Para 2',
    'Para 3',
    'Para 4',
    'Para 5',
    'Para 6',
    'Para 1',
    'Para 2',
    'Para 3',
    'Para 4',
    'Para 5',
    'Para 6',
  ];
  final List<String> arabic = [
    'الٓمٓ',
    'سَيَقُولُ',
    'تِلْكَ الرُّسُلُ',
    'نْ تَنَالُوا',
    'وَالْمُحْصَنَاتُ',
    'لَا يُحِبُّ اللَّهُ',
    'وَإِذَا سَمِعُوا'
        'وَلَوْ أَنَّنَا',
    'الٓمٓ',
    'سَيَقُولُ',
    'تِلْكَ الرُّسُلُ',
    'نْ تَنَالُوا',
    'وَالْمُحْصَنَاتُ',
    'لَا يُحِبُّ اللَّهُ',
    'وَإِذَا سَمِعُوا'
        'وَلَوْ أَنَّنَا',
    'الٓمٓ',
    'سَيَقُولُ',
    'تِلْكَ الرُّسُلُ',
    'نْ تَنَالُوا',
    'وَالْمُحْصَنَاتُ',
    'لَا يُحِبُّ اللَّهُ',
    'وَإِذَا سَمِعُوا'
        'وَلَوْ أَنَّنَا',
  ];

  @override
  Widget build(BuildContext context) {
    // Define a function to build each list item

    // Replace with your Sura screen implementation
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.separated(
          itemCount: surah.length,
          itemBuilder: (context, index) {
            return listOfSurah(index);
          },
          separatorBuilder: (context, index) {
            return Divider(
              // You can customize the separator here
              color: black,
              thickness: 0.77,
            );
          },
        ),
      ),
    );
  }

  ListTile listOfSurah(int index) {
    return ListTile(
      //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      dense: true,
      leading: Stack(
        children: [
          Image(
            height: 40,
            width: 50,
            image: AssetImage('assets/images/quran-screen-counting.png'),
          ),
          Positioned(
            top: 13,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      title: Transform.translate(
        offset: Offset(-10, 0),
        child: Text(
          para[index],
          style: TextStyle(fontSize: 11),
        ),
      ),
      subtitle: Transform.translate(
        offset: Offset(-10, 0),
        child: Text(
          surah[index],
          style: TextStyle(
              fontWeight: FontWeight.bold, color: primaryColor, fontSize: 16),
        ),
      ),
      trailing: Text(arabic[index],
          style: TextStyle(
              fontWeight: FontWeight.bold, color: primaryColor, fontSize: 16)),
    );
  }
}
