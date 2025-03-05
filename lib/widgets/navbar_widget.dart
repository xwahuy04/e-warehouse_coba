import 'package:flutter/material.dart';
import '../screens/kategori/kategori_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/satuan/satuan_screen.dart';
import '../screens/lapor_masalah_screen.dart';

class CustomBottomNavbar extends StatelessWidget {
  final String currentPage;
  const CustomBottomNavbar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(context, 'Beranda', currentPage == 'Beranda'),
          _buildNavItem(context, 'Kategori', currentPage == 'Kategori'),
          _buildNavItem(context, 'Satuan', currentPage == 'Satuan'),
          _buildNavItem(context, 'Lapor Masalah', currentPage == 'Lapor Masalah'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, bool isActive) {
    IconData getIcon() {
      switch (title) {
        case 'Beranda':
          return Icons.home;
        case 'Kategori':
          return Icons.category;
        case 'Satuan':
          return Icons.scale;
        case 'Lapor Masalah':
          return Icons.report_problem;
        default:
          return Icons.circle;
      }
    }

    void handleNavigation(BuildContext context, String title) {
      // Jika sudah di halaman yang sama, pop semua route sampai route pertama
      if (title == currentPage) {
        Navigator.popUntil(context, (route) => route.isFirst);
        return;
      }

      // Push ke halaman baru
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          switch (title) {
            case 'Beranda':
              return DashboardScreen();
            case 'Kategori':
              return KategoriWidget();
            case 'Satuan':
              return SatuanWidget();
            case 'Lapor Masalah':
              return LaporMasalahWidget();
            default:
              return DashboardScreen();
          }
        }),
      );
    }

    return GestureDetector(
      onTap: () => handleNavigation(context, title),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getIcon(),
            color: isActive ? Color(0xFF539CF3) : Color(0xFF474B51),
            size: 24,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              color: isActive ? Color(0xFF539CF3) : Color(0xFF474B51),
              fontFamily: 'Poppins',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}