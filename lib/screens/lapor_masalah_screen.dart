import 'package:flutter/material.dart';
import '../widgets/navbar_widget.dart';

class LaporMasalahWidget extends StatefulWidget {
  @override
  _LaporMasalahWidgetState createState() => _LaporMasalahWidgetState();
}

class _LaporMasalahWidgetState extends State<LaporMasalahWidget> {
  TextEditingController _textController = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _hasText = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Image.asset(
                      'assets/images/lapor_masalah/seru.png',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 30, bottom: 100),
                      padding: EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lapor Masalah',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.all(15),
                            height: 137,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              controller: _textController,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Ketikkan Masalah disini....',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              onPressed: _hasText ? () {} : null,
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  'Laporkan Masalah',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _hasText ? Color(0xFF1F41BB) : Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: _hasText ? 8 : 0,
                                shadowColor: _hasText ? Color(0xFF1F41BB).withOpacity(0.5) : Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(currentPage: 'Lapor Masalah'),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
