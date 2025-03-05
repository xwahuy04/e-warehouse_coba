import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight,
            ),
            child: Container(
              width: screenWidth,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Image
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.05),
                    width: double.infinity,
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/welcome.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.08),

                  // Title
                  Center(
                    child: Text(
                      'E-warehouse',
                      style: TextStyle(
                        color: Color(0xFF1F41BB),
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.05),

                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: Text(
                      'Solusi sederhana untuk mengelola dan memantau persediaan barang di gudang Anda.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.04,
                        height: 1.5,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.08),

                  // Login Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F41BB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                        elevation: 8,
                        shadowColor: Color(0xFFCAD6FF),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
