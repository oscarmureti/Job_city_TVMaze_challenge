import 'package:flutter/material.dart';
import 'package:job_city_challenge/src/presentation/presenters/splash_presenter/splash_presenter.dart';
import 'package:job_city_challenge/src/ui/mixins/navigation_manager.dart';
import 'package:job_city_challenge/src/ui/pages/personal_info/set_name.dart';
import 'package:job_city_challenge/src/ui/pages/personal_info/set_pin.dart';
import 'package:job_city_challenge/src/ui/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  final SplashPresenter presenter;
  const SettingsPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with NavigationManager {
  late final ScrollController controller;
  int? pin;
  String? name;
  String? email;
  @override
  void initState() {
    getprefData();
    super.initState();
  }

  getprefData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      pin = prefs.getInt("pin");
      name = prefs.getString("name");
      email = prefs.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              radius: 60.0,
              backgroundColor: AppColors.primary,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: buildProfile(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: ListTile(
                title: Text(
                  'Account Information ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            phoneSetting(),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: ListTile(
                title: Text(
                  'Preference Settings ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            buildBiometricsSwitch(),
            buildDeleteAccount(),
            buildLogout(),
          ],
        ),
      ),
    );
  }

  Widget buildDeleteAccount() {
    bool status = false;
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Card(
          color: Colors.red,
          elevation: 0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: Center(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            title: GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                int? value = prefs.getInt("pin");
                await prefs.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PersonalInfoScreen(presenter: widget.presenter),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: const Text(
                'Delete Account',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),
          ),
        ));
  }

  Widget buildLogout() {
    bool status = false;
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 16,
                child: Center(
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ),
              title: GestureDetector(
                onTap: () async {
                  var prefs = await SharedPreferences.getInstance();
                  int? value = prefs.getInt("pin");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PinScreen(value: pin, presenter: widget.presenter),
                      ),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  // FirebaseAuth.instance.signOut().then((value) {
                  //   Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => OnBoardScreen(),
                  //       ),
                  //       (Route<dynamic> route) => false);
                  // });
                },
              )),
        ));
  }

  Widget buildBiometricsSwitch() {
    bool status = false;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 16,
            child: Center(
              child: Icon(
                Icons.fingerprint,
                color: Colors.white,
              ),
            ),
          ),
          title: const Text(
            'Biometric Security',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: const Text(
            'Ask for fingerprint every time you open the application',
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Switch(
            value: status,
            activeColor: AppColors.primary,
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.grey,
            onChanged: status
                ? (value) {
                    true;
                  }
                : null,
          ),
          onTap: () {
            status == false ? status == true : status = false;
          },
        ),
      ),
    );
  }

  phoneSetting() {
    // var currentUser = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 16,
            child: Center(
              child: Icon(
                Icons.mail,
                color: Colors.white,
              ),
            ),
          ),
          title: const Text(
            'Email',
            style: TextStyle(
              letterSpacing: 0.6,
              // color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          trailing: Text(
            email ?? '',
            textAlign: TextAlign.start,
            style: const TextStyle(
              letterSpacing: 0.6,
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  ListTile buildProfile() {
    return ListTile(
      leading: Text(
        'name',
        textAlign: TextAlign.start,
        style: const TextStyle(
          letterSpacing: 1.2,
          color: Colors.grey,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      title: Text(
        name ?? '',
        textAlign: TextAlign.start,
        style: const TextStyle(
          letterSpacing: 0.6,
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      trailing: IconButton(
          onPressed: () {
            // showModalBottomSheet(
            //   context: context,
            //   isScrollControlled: true,
            //   builder: (context) => UpdateNameDialog(
            //     user_name: staff.staff_name,
            //   ),
            // );
          },
          icon: const Icon(Icons.edit, color: Colors.blue)),
    );
  }
}
