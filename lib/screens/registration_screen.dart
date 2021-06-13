import 'package:flutter/material.dart';
import 'package:rest_api_app/model/registration_model.dart';
import 'package:rest_api_app/screens/login_screen.dart';
import 'package:rest_api_app/view_model/api_viewmodel.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  Registration _registration = new Registration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      labelText: "Name",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    return value.contains("@") ? null : "Enter valid Email";
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      labelText: "Email",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    return value.length >= 6
                        ? null
                        : "Password must be 6 characters";
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobileController,
                  validator: (value) {
                    return value.length < 10 ? "Enter valid Mobile" : null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      labelText: "Mobile Number",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      print(_nameController.text);
                      print(_emailController.text);
                      print(_passwordController.text);
                      print(_mobileController.text);
                      if (_key.currentState.validate()) {
                        print("Validated");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));

                        _registration.mobileNumber = _mobileController.text;
                        _registration.language = 'en';
                        // ApiResponse res = ApiResponse();
                        ApiViewModel model = ApiViewModel();
                        await model.getRegister(_registration);
                      } else {
                        print("Please enter all fields");
                      }
                    },
                    color: Colors.orangeAccent,
                    child: Text("Register"),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
