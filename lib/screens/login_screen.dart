import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const String _locationSvg = 'assets/images/location.svg';
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  bool _isHidden = true;

  final Widget svg = SvgPicture.asset(
    _locationSvg,
    semanticsLabel: 'Location SVG',
  );

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 400,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: svg,
            ),
            Text(
              'Welcome Back!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Text(
              'Login and start your journey',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).accentColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'email',
                        labelStyle: Theme.of(context).textTheme.subtitle1,
                      ),
                      controller: _emailController,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      obscureText: _isHidden,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Theme.of(context).accentColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'password',
                        labelStyle: Theme.of(context).textTheme.subtitle1,
                        suffixIcon: IconButton(
                          icon: _isHidden
                              ? Icon(
                                  Icons.visibility,
                                  color: Theme.of(context).accentColor,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Theme.of(context).accentColor,
                                ),
                          onPressed: _toggleVisibility,
                        ),
                      ),
                      controller: _passwordController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 60,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              child: RaisedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  print(_emailController.text);
                  print(_passwordController.text);
                },
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Or Signin With',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            // Add google icon button
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                FlatButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
