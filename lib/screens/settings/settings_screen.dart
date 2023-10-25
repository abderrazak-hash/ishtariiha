import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/settings_controller.dart';
import 'package:ishtariha/screens/login/login_screen.dart';
import 'package:ishtariha/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (context, settingsController, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          while (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'تسجيل الخروج',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: red,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'اشترها',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: mainClr,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'اﻹعدادات',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const Text('رقم الهاتف'),
                  const SizedBox(height: 10.0),
                  Input(
                    controller: settingsController.phoneController,
                    hintText: '0554226683',
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('ظهور رقم هاتفك في اﻹعلانات'),
                      CheckSquare(
                        value: settingsController.showPhone,
                        onChanged: (value) {
                          settingsController.switchShowPhone(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('حذف إعلاناتك بعد فترة معينة'),
                      CheckSquare(
                        value: settingsController.removeAds,
                        onChanged: (value) {
                          settingsController.switchRemoveAds(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: Button(
                      onPressed: () {},
                      label: 'تحديث',
                      width: screenWidth * .6,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(
                    thickness: 3,
                  ),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Text(
                        'سياسة الخصوصية',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView(
                      children: const [
                        Text(
                          'تطبيق اشترها\n'
                          'يوفر لك تطبيق اشترها مجموعة كبيرة من اﻹعلانات المتعلقة ببيع، استبدال السيارات الجديدة والمستعملة، كما يوفر كل المعلومات الضرورية للمستخدم من أجل ضمان تواصل سهل ومميز بين المعلن والمستفسر\n'
                          'يفرض تطبيق اشترها على مستخدميه جملة من القواعد التي تهدف إلى ضمان حقوقهم كمعلنين أو مشترين\n'
                          'عدم بيع، استعارة أو تأجير حسابك على اشترها\n'
                          'نشر إعلان ذات مصداقية ومعلومات صحيحة\n'
                          'عدم اﻹعلان عن منتجات خارجة عن مجال السيارات\n'
                          'تتم معاقبة المخالفين إما بتوقيف الحساب لفترة معينة إو إغلاقه بالكلية\n'
                          '',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            height: 1.5,
                          ),
                        ),
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
  }
}
