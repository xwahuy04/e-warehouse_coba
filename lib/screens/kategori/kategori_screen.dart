import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/navbar_widget.dart';

class KategoriWidget extends StatefulWidget {
  @override
  _KategoriWidgetState createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.white,
        child: Stack(
          children: [
            // Search Bar
            Positioned(
              top: padding.top + 80,
              left: screenSize.width * 0.03,
              right: screenSize.width * 0.03,
              child: Container(
                height: screenSize.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFF1F41BB),
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari kategori',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: screenSize.width * 0.05,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenSize.width * 0.04),
                      child: SvgPicture.asset(
                        'assets/images/kategori/search.svg',
                        width: screenSize.width * 0.08,
                        height: screenSize.width * 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Center Message
            Center(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: 'Klik tanda tambah di bawah\nuntuk menambah kategori', // Pakai \n agar langsung jadi 2 baris
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: screenSize.width * 0.045, // Responsif
          fontWeight: FontWeight.w200, // Poppins-Thin
        ),
        border: InputBorder.none, 
        contentPadding: EdgeInsets.only(top: 30),
      ),
      maxLines: 2, // Memastikan teks selalu 2 baris
      keyboardType: TextInputType.multiline, 
    ),
  ),
),

          ],
        ),
      ),
    floatingActionButton: Padding(
  padding: EdgeInsets.only(bottom: screenSize.height * 0.03), // Reduced value for closer spacing
  child: Container(
    width: screenSize.width * 0.13,
    height: screenSize.width * 0.13,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/kategori/tambah.png'),
        fit: BoxFit.cover,
      ),
    ),
  ),
),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: CustomBottomNavbar(currentPage: 'Kategori'),
    );
  }
}
