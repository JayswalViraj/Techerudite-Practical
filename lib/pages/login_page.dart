import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practicaltecherudite/api_services/api_services.dart';
import 'package:practicaltecherudite/models/logig_model.dart';
import 'package:practicaltecherudite/pages/home_page.dart';
import 'package:practicaltecherudite/responsiv_layout/responsiv_class.dart';
import 'package:practicaltecherudite/utils/assets_path.dart';
import 'package:practicaltecherudite/utils/colors.dart';
import 'package:practicaltecherudite/validates/validates.dart';
import 'package:practicaltecherudite/widgets/custome_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:practicaltecherudite/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight,
              color: AppColors.primeryColor,
              child: Container(
                width: double.infinity,
                color: AppColors.primeryColor,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: SizeConfig.heightMultiplier * 30,
                      color: AppColors.gray3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomeText(
                            text: "Plie",
                            color: Colors.black,
                            fontSize: 72,
                            fontWeight: FontWeight.w400,
                          ),
                          Image.asset(
                            AssetsResources().loginIcon,
                            height: SizeConfig.heightMultiplier * 6,
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 7,
                          right: SizeConfig.widthMultiplier * 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.widthMultiplier * 1),
                              alignment: Alignment.centerLeft,
                              child: CustomeText(
                                text: "Email",
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.widthMultiplier * 2)),
                            child: TextFormField(
                              /*
                              validator: (value) {
                                return Validates.validateEmail(value!);
                              },*/
                              controller: username,
                              style: TextStyle(
                                  color: AppColors.gray3, fontSize: 14),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: AppColors.gray3, fontSize: 14),
                                  hintText: "Email",
                                  fillColor: AppColors.white),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.widthMultiplier * 1),
                              alignment: Alignment.centerLeft,
                              child: CustomeText(
                                text: "Password",
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.widthMultiplier * 2)),
                            child: TextFormField(
                              style: TextStyle(
                                  color: AppColors.gray3, fontSize: 14),
                              obscureText: hidePassword,

                              /* validator: (value) {
                                return Validates.validatePassword(
                                    value.toString());
                              },*/
                              controller: password,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: hidePassword
                                          ? Icon(
                                              Icons.visibility_off_outlined,
                                              color: AppColors.gray3,
                                            )
                                          : Icon(
                                              Icons.visibility_outlined,
                                              color: AppColors.gray3,
                                            ),
                                      onPressed: () {
                                        hidePassword = !hidePassword;
                                        setState(() {});
                                      }),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: AppColors.gray3, fontSize: 14),
                                  hintText: "Password",
                                  fillColor: AppColors.white),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.widthMultiplier * 1),
                              alignment: Alignment.topRight,
                              child: CustomeText(
                                text: "Forgot Password?",
                                color: AppColors.gray3,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.signInButtonColor)),
                              onPressed: () async {
                                ApiServices.callLoginApi(
                                        email: username.text,
                                        password: password.text)
                                    .then((value) => {
                                          if (value == true)
                                            {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      successSnackBar),
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (cotext) =>
                                                          HomePage()))
                                            }
                                          else
                                            {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(failSnackBar),
                                            }
                                        });

                                /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (cotext) => HomePage()));*/
                              },
                              child: CustomeText(
                                text: "Sign In",
                                color: AppColors.white,
                              )),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                          CustomeText(
                            text: "Not a member? Sign Up Here",
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 6,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 1,
                                color: AppColors.gray2,
                              )),
                              SizedBox(
                                width: SizeConfig.widthMultiplier * 1,
                              ),
                              CustomeText(
                                text: "or Sign In with:",
                                color: AppColors.gray2,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              SizedBox(
                                width: SizeConfig.widthMultiplier * 1,
                              ),
                              Expanded(
                                  child: Container(
                                height: 1,
                                color: AppColors.gray2,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsResources().googleIcon,
                                height: SizeConfig.heightMultiplier * 8,
                              ),
                              Image.asset(
                                AssetsResources().appleIcon,
                                height: SizeConfig.heightMultiplier * 8,
                              ),
                              Image.asset(
                                AssetsResources().facebookIcon,
                                height: SizeConfig.heightMultiplier * 8,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                          CustomeText(
                            text: "Enter as Guest",
                            color: AppColors.gray3,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
