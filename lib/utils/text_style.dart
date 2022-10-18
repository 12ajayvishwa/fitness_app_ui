import 'package:flutter/material.dart';

double sizeH1 = 26; 
double sizeH2 = 24;
double sizeH3 = 22;
double sizeH4 = 20;
double sizeTextSub = 18;
double largeTextSize = 16;
double mediumTextSize = 14;
double smallTextSize = 14;
double captionTextSize = 10;




//Heading 1
var kTitleH1Bold = TextStyle(fontFamily: "Poppins",fontSize: sizeH1,fontWeight: FontWeight.bold);
var kTitleH1SemiBold = TextStyle(fontFamily: "Poppins",fontSize: sizeH1,fontWeight: FontWeight.w600);
var kTitleH1Medium = TextStyle(fontFamily: "Poppins",fontSize: sizeH1,fontWeight: FontWeight.w500);
var kTitleH1Regular = TextStyle(fontFamily: "Poppins",fontSize: sizeH1);

//Heading 2
var kTitleH2Bold = TextStyle(fontFamily: "Poppins",fontSize: sizeH2,fontWeight: FontWeight.bold,color: Colors.black);
var kTitleH2SemiBold = TextStyle(fontFamily: "Poppins",fontSize: sizeH2,fontWeight: FontWeight.w600);
var kTitleH2Medium = TextStyle(fontFamily: "Poppins",fontSize: sizeH2,fontWeight: FontWeight.w500);
var kTitleH2Regular = TextStyle(fontFamily: "Poppins",fontSize: sizeH2);

//Heading 3
var kTitleH3Bold = TextStyle(fontFamily: "Poppins",fontSize: sizeH3,fontWeight: FontWeight.bold);
var kTitleH3SemiBold = TextStyle(fontFamily: "Poppins",fontSize: sizeH3,fontWeight: FontWeight.w600);
var kTitleH3Medium = TextStyle(fontFamily: "Poppins",fontSize: sizeH3,fontWeight: FontWeight.w500);
var kTitleH3Regular = TextStyle(fontFamily: "Poppins",fontSize: sizeH3);

//Heading 4
kTitleH4Bold(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: sizeH4,fontWeight: FontWeight.bold,color: color);
}
var kTitleH4SemiBold = TextStyle(fontFamily: "Poppins",fontSize: sizeH4,fontWeight: FontWeight.w600);
var kTitleH4Medium = TextStyle(fontFamily: "Poppins",fontSize: sizeH4,fontWeight: FontWeight.w500);
var kTitleH4Regular = TextStyle(fontFamily: "Poppins",fontSize: sizeH4);

//Subtitle
var kTextSubBold = TextStyle(fontFamily: "Poppins",fontSize: sizeTextSub,fontWeight: FontWeight.bold);
var kTextSubSemiBold = TextStyle(fontFamily: "Poppins",fontSize: sizeTextSub,fontWeight: FontWeight.w600);
var kTextSubMedium = TextStyle(fontFamily: "Poppins",fontSize: sizeTextSub,fontWeight: FontWeight.w500);
var kTextSubRegular = TextStyle(fontFamily: "Poppins",fontSize: sizeTextSub);

//Large text
var kLargeTextBold = TextStyle(fontFamily: "Poppins",fontSize: largeTextSize,fontWeight: FontWeight.bold,color: Colors.white);
var kLargeTextSemiBold = TextStyle(fontFamily: "Poppins",fontSize: largeTextSize,fontWeight: FontWeight.w600);
var kLargeTextMedium = TextStyle(fontFamily: "Poppins",fontSize: largeTextSize,fontWeight: FontWeight.w500);
kLargeTextRegular(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: largeTextSize,color: color);
}

//Medium text
var kMediumTextBold = TextStyle(fontFamily: "Poppins",fontSize: mediumTextSize,fontWeight: FontWeight.bold);
kMediumTextSemiBold({Color? color}){
  return TextStyle(fontFamily: "Poppins",fontSize: mediumTextSize,fontWeight: FontWeight.w600,color: Colors.white);
} 
var kMediumTextMedium = TextStyle(fontFamily: "Poppins",fontSize: mediumTextSize,fontWeight: FontWeight.w500);
kMediumTextRegular(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: mediumTextSize,color: color);
}  

//Small text
var kSmallTextBold = TextStyle(fontFamily: "Poppins",fontSize: smallTextSize,fontWeight: FontWeight.bold);
kSmallTextSemiBold(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: smallTextSize,fontWeight: FontWeight.w600,color: color);
} 
kSmallTextMedium(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: smallTextSize,fontWeight: FontWeight.w500,color: color);
} 
kSmallTextRegular(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: smallTextSize,color: color);
}

//Caption text
var kCaptionTextBold = TextStyle(fontFamily: "Poppins",fontSize: captionTextSize,fontWeight: FontWeight.bold);
kCaptionTextSemiBold(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: captionTextSize,fontWeight: FontWeight.w600,color: color,letterSpacing: 1,);
}
var kCaptionTextMedium = TextStyle(fontFamily: "Poppins",fontSize: captionTextSize,fontWeight: FontWeight.w500);
kCaptionTextRegular(Color color){
  return TextStyle(fontFamily: "Poppins",fontSize: captionTextSize,color: color);
}



