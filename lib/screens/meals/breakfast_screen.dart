import 'package:fitness_ui/modal/category_model.dart';
import 'package:fitness_ui/screens/meals/custom_text.dart';
import 'package:fitness_ui/widgets/custom_appBAr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BreakFastScreen extends StatefulWidget {
  const BreakFastScreen({Key? key}) : super(key: key);

  @override
  State<BreakFastScreen> createState() => _BreakFastScreenState();
}

class _BreakFastScreenState extends State<BreakFastScreen> {
  int selectCard=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              customAppBar(),
              SizedBox(height: 30,),
              searchCard(),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomText(
                    title: "Category",
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
             SizedBox(height: 15,),
              categoryCard(),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomText(
                    title: "Recommendation for Diet",
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15,),
              cakeCard(context),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: CustomText(
                    title: "Popular",
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 80,
                width: double.maxFinite,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 2.0,
                      color: Colors.black.withOpacity(0.07),
                      spreadRadius: 2)
                ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/cake2.png",
                      height: 46,
                      width: 45,
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            title: "Blueberry Pancake",
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        CustomText(
                            title: "Medium | 30mins | 230kCal",
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400)
                      ],
                    )),
                    SvgPicture.asset("assets/image/arrowforward.svg")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox cakeCard(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 30),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
               
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: Color(0xff9DCEFF).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Image.asset("assets/images/cake2.png"),
                    SizedBox(height: 15,),
                    CustomText(
                        title: "Honey Pancake",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    CustomText(
                        title: "Easy | 30mins | 180kCal",
                        fontSize: 12,
                        color: Color(0xff7B6F72),
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 10,),
                    selectCard == index
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff9DCEFF),
                                    Color(0xff92A3FD),
                                  ]),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: CustomText(
                              title: "view",
                              fontSize: 12,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : CustomText(
                            title: "view",
                            fontSize: 12,
                            color: Color(0xffEEA4CE),
                            fontWeight: FontWeight.w600,
                          ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  SizedBox categoryCard() {
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 30),
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: CategoryModel.categoryList.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                    color: CategoryModel.categoryList[index].color,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child:
                          Image.asset(CategoryModel.categoryList[index].image),
                    ),
                    SizedBox(height: 10,),
                    CustomText(
                        title: CategoryModel.categoryList[index].title,
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container searchCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 2,
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 0.5))
      ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 10),
                hintText: "Search pancake",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(
                  Icons.search,
                )),
          )),
          Text(
            "|",
            style: TextStyle(fontSize: 24, color: Color(0xffDDDADA)),
          ),
          SizedBox(width: 10,),
          Container(
            child: Icon(Icons.tune),
          ),
          SizedBox(width: 10,)
        ],
      ),
    );
  }

  Container customAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomAppBar(title: "Breakfast"),
         
    );
  }
}
