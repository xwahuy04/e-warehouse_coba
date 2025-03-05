import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_screen.dart';

class ProdukScreen extends StatelessWidget {
  const ProdukScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              
              // Header with back button
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/produk/back.png',
                        width: 45,
                        height: 27,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Semua Barang',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Search bar and filter buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 57,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF1F41BB),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            SvgPicture.asset(
                              'assets/images/produk/search.svg',
                              width: 24,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Cari Produk',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 8),
                    _buildFilterButton('assets/images/produk/kategori.svg'),
                    const SizedBox(width: 8),
                    _buildFilterButton('assets/images/produk/urut.svg'),
                  ],
                ),
              ),

              // Center message
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                    child: Text(
                      'Klik tanda tambah di bawah\nuntuk menambah produk',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontFamily: 'Poppins',
                        fontSize: screenSize.width * 0.045,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AddProdukScreen()),
              );
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/produk/tambah.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget _buildFilterButton(String svgPath) {
    return Container(
      width: 54,
      height: 49,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: SvgPicture.asset(
          svgPath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
