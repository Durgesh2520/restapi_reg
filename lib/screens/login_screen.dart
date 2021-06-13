import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_app/categoryWidget.dart';
import 'package:rest_api_app/view_model/api_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      return value.length > 6
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
                  Container(
                    width: double.infinity,
                    child: RaisedButton(onPressed: () async {
                      print(_mobileController.text);
                      print(_passwordController.text);
                      if (_key.currentState.validate()) {
                        print("Validated");
                      } else {
                        print("Not Validated");
                      }
                      ApiViewModel model = ApiViewModel();
                      var res2 = await model.getLoginDetails(
                          _mobileController.text, _passwordController.text);
                      if (res2 != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CategoryWidget()));
                      }
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      );
                    }),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
