import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _handleLogin() {
  String username = usernameController.text.trim();
  String password = passwordController.text.trim();

  if (username.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Username dan Password harus diisi'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  // Here you can add your authentication logic
  // For now, we'll just navigate to dashboard
  Navigator.pushReplacementNamed(context, '/dashboard');
}

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.15),
              
              // Login Title
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.08,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: screenHeight * 0.1),

              // Username Field
              Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: SvgPicture.asset(
                        '../assets/images/user.svg',
                        width: screenWidth * 0.06,
                        height: screenWidth * 0.06,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: usernameController,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Username',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Password Field
              Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: SvgPicture.asset(
                        '../assets/images/password.svg',
                        width: screenWidth * 0.06,
                        height: screenWidth * 0.06,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        obscureText: !_isPasswordVisible,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                              size: screenWidth * 0.06,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.08),

              // Login Button
// Then update your login button's onTap:
GestureDetector(
  onTap: _handleLogin,
  child: Container(
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.15,
      vertical: screenHeight * 0.02,
    ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(31, 65, 187, 1),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(202, 214, 255, 1),
          offset: Offset(0, 10),
          blurRadius: 20,
        ),
      ],
    ),
    child: Text(
      'Masuk',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        fontSize: screenWidth * 0.05,
      ),
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
