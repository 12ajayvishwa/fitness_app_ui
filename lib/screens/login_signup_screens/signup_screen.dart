import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/custom_text_input_field.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

  final GlobalKey<State> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 50,
              child: Column(
                children: [
                  Text("Hey there,",style: kLargeTextRegular(const Color(0xFF1D1617)),),
                  const SizedBox(height: 5,),
                  Text("Create an Account",style: kTitleH4Bold(const Color(0xFF1D1617)),)
                ],
              )),
            Positioned(
              child: formComponent())
          ]),
      ),
    );
  }

  formComponent(){
    return  Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField()
        ],
      ));
  }
  
}