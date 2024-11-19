import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LedgerScreen extends StatefulWidget {
  const LedgerScreen({super.key});

  @override
  State<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> {
  final List<Map<String, dynamic>> earningLedgerList = [
    {'title': 'Earning by Azan', 'subtitle': '50\$'},
    {
      'title': 'Earning by Salat',
      'subtitle': '15\$',
    },
    {'title': 'Earning by Dua', 'subtitle': '25\$'},
    {'title': 'Earning by Salat', 'subtitle': '35\$'},
    {'title': 'Earning by Azan', 'subtitle': '50\$'},
    {
      'title': 'Earning by Salat',
      'subtitle': '15\$',
    },
    {'title': 'Earning by Dua', 'subtitle': '25\$'},
    {'title': 'Earning by Salat', 'subtitle': '35\$'},
    {'title': 'Earning by Azan', 'subtitle': '50\$'},
    {
      'title': 'Earning by Salat',
      'subtitle': '15\$',
    },
    {'title': 'Earning by Dua', 'subtitle': '25\$'},
    {'title': 'Earning by Salat', 'subtitle': '35\$'},
    {'title': 'Earning by Azan', 'subtitle': '50\$'},
    {
      'title': 'Earning by Salat',
      'subtitle': '15\$',
    },
    {'title': 'Earning by Dua', 'subtitle': '25\$'},
    {'title': 'Earning by Salat', 'subtitle': '35\$'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.w),
                        bottomLeft: Radius.circular(20.w))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: lightBlack,
                                border: Border.all(color: white, width: 2)),
                            child: Center(
                              child: Icon(Icons.arrow_back,
                                  color: white, size: 20),
                            ),
                          ),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ledger'Detail",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: yellowC),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h, bottom: 10.h),
                          child: Text(
                            "Total Amount 10\$",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: white),
                          ),
                        ),
                        Text(
                          "Total Withdraw Amount 3\$",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: earningLedgerList.length,
                itemBuilder: (context, index) {
                  final ledger = earningLedgerList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ledger['title'],
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          ledger['subtitle'],
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: black);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
