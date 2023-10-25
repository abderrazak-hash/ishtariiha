import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/register_person_controller.dart';
import 'package:ishtariha/controllers/register_show_controller.dart';
import 'package:ishtariha/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static bool firstTime = true;
  final bool isShow;
  const RegisterScreen({Key? key, this.isShow = false}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterPersonController>(
      create: (context) => RegisterPersonController(),
      child: ChangeNotifierProvider<RegisterShowController>(
        create: (context) => RegisterShowController(),
        child: Consumer<RegisterShowController>(
          builder: (context, registerShowController, child) {
            return Consumer<RegisterPersonController>(
              builder: (context, registerPersonController, child) {
                return SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    '،أهلا بك',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  Text(
                                    'تسجيل جديد',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Input(
                                  hintText: widget.isShow
                                      ? 'اسم المعرض'
                                      : 'رقم الهاتف',
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                    if (widget.isShow) {
                                      registerShowController.client.name =
                                          value;
                                    } else {
                                      registerPersonController.client.phone =
                                          value;
                                    }
                                  },
                                ),
                                Input(
                                  hintText: 'كلمة المرور',
                                  obscureText: true,
                                  letterSpacing: 4,
                                  onChanged: (value) {
                                    if (widget.isShow) {
                                      registerShowController.client.password =
                                          value;
                                    } else {
                                      registerPersonController.client.password =
                                          value;
                                    }
                                  },
                                ),
                                Button(
                                  onPressed: () {
                                    RegisterScreen.firstTime = false;
                                    if (widget.isShow) {
                                      registerShowController.register(context);
                                    } else {
                                      registerPersonController
                                          .register(context);
                                    }
                                  },
                                  label: 'تسجيل',
                                  width: screenWidth * .6,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                // const Text(
                                //   ' هل تملك حسابا؟ ',
                                // ),
                                // InkWell(
                                //   onTap: () {
                                //     // registerController.login(context);
                                //   },
                                //   child: const Text(
                                //     'تسجيل الدخول',
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: mainClr,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
