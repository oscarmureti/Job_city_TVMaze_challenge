import 'package:flutter/material.dart';
import 'package:job_city_challenge/src/presentation/presenters/splash_presenter/splash_presenter.dart';
import 'package:job_city_challenge/src/ui/pages/personal_info/set_pin.dart';
import 'package:job_city_challenge/src/ui/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfoScreen extends StatefulWidget {
  final SplashPresenter presenter;
  const PersonalInfoScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pin = TextEditingController();
  final TextEditingController repeatPin = TextEditingController();
  bool loader = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildFirstNameTF() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15.0),
          const Text(
            'Name',
            // style: kLabelStyle,
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            // decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              // style: TextStyle(
              //   color: Colors.white,
              //   fontFamily: 'OpenSans',
              // ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                ),
                contentPadding: EdgeInsets.only(top: 14.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person,
                  // color: Colors.white,
                ),
                hintText: 'Enter your name',

                // hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmail() {
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15.0),
          const Text(
            'Email',
            // style: kLabelStyle,
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            // decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              // style: TextStyle(
              //   color: Colors.white,
              //   fontFamily: 'OpenSans',
              // ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                ),
                contentPadding: EdgeInsets.only(top: 14.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email,
                  // color: Colors.white,
                ),
                hintText: 'Enter your email',
                // hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassword() {
    return Form(
      key: _formKey3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15.0),
          const Text(
            'Set Pin',
            // style: kLabelStyle,
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            // decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              maxLength: 4,
              controller: pin,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your pin';
                }
                return null;
              },
              // style: TextStyle(
              //   color: Colors.white,
              //   fontFamily: 'OpenSans',
              // ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                ),
                contentPadding: EdgeInsets.only(top: 14.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                  // color: Colors.white,
                ),
                hintText: 'Enter your Pin',
                // hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRepeatPassword() {
    return Form(
      key: _formKey4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15.0),
          const Text(
            'Repeat Pin',
            // style: kLabelStyle,
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            // decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              maxLength: 4,
              controller: repeatPin,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your pin again';
                } else if (pin.text != repeatPin.text) {
                  return 'Pin does not match';
                }
                return null;
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                ),
                contentPadding: EdgeInsets.only(top: 14.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                  // color: Colors.white,
                ),
                hintText: 'Enter your pin again',
                // hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ContinueButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          onPrimary: Color(0xFF212C37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          if (_formKey.currentState!.validate() &&
              _formKey2.currentState!.validate()) {
            snackBar("Profile Updated Successfully!!");
            prefs.setString('email', emailController.text);
            prefs.setString('name', nameController.text);
            prefs.setInt('pin', int.parse(pin.text));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PinScreen(
                      value: int.parse(pin.text), presenter: widget.presenter),
                ),
                (Route<dynamic> route) => false);
          }
        },
        child: const Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _loaderbtn() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 10,
      child: TextButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF206BC4),
            onPrimary: Color(0xFF212C37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: const CircularProgressIndicator(
            color: Colors.white,
          )),
    );
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
            'Set Personal Details',
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
          children: [
            // inputTitleText("Email Address"),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: _buildFirstNameTF(),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: _buildEmail(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: _buildPassword(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: _buildRepeatPassword(),
            ),

            loader == false
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                    child: _ContinueButton(),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                    child: _loaderbtn(),
                  ),
          ],
        ),
      ),
    );
  }
}
