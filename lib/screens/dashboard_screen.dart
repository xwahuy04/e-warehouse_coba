import 'package:flutter/material.dart';
import '../widgets/navbar_widget.dart';
import 'barang/index_screen.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Color(0xFF8EADD3),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        _buildHeader(context),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        _buildStatCards(context),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        _buildInfoCards(context),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        _buildActionButtons(context),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
       bottomNavigationBar: CustomBottomNavbar(currentPage: 'Beranda'),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  _buildProfileImage(),
                  SizedBox(width: 15),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Karyawan',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8), 
                        Text(
                          'Anda dapat mengelola barang, stok masuk, stok keluar',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                  padding: EdgeInsets.all(8),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                  padding: EdgeInsets.all(8),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 23,
            child: Image.asset(
              'assets/images/dashboard/user.png',
              width: 43,
              height: 51,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 7,
            right: 3,
            child: Image.asset(
              'assets/images/dashboard/kamera.png',
              width: 19,
              height: 19,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCards(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            margin: EdgeInsets.only(right: 8),
            child: _buildStatCard(context, 'Barang', '0', 'assets/images/dashboard/barang.png'),
            
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            margin: EdgeInsets.only(left: 8),
            child: _buildStatCard(context, 'Stok Rendah', '0', 'assets/images/dashboard/stok_rendah.png'),
          ),
        ),
      ],
    );
  }

// Update the _buildStatCard method to include onTap functionality
Widget _buildStatCard(BuildContext context, String title, String value, String imagePath) {
  bool isBarang = title == 'Barang';
  
  return GestureDetector(
    onTap: () {
      if (isBarang) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProdukScreen()),
        );
      }
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          color: Color(0xFF22177A),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(2, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
            ),
          ),
          SizedBox(width: isBarang ? 15 : 0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: isBarang ? 15 : 0),
        ],
      ),
    ),
  );
}






  Widget _buildInfoCards(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.only(right: 8),
            child: _buildInfoCard(context, 'Transaksi', '0', 'assets/images/dashboard/tranksaksi.png'),
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.only(left: 8),
            child: _buildInfoCard(context, 'Laporan', '0', 'assets/images/dashboard/laporan.png'),
          ),
        ),
      ],
    );
  }

 Widget _buildInfoCard(BuildContext context, String title, String value, String imagePath) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xFFCBDCEB),
      border: Border.all(
        color: Color(0xFF22177A),
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: Offset(0, 8),
          blurRadius: 4,
        ),
      ],
    ),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width * 0.15, // Smaller icon size
            height: MediaQuery.of(context).size.width * 0.15, // Smaller icon size
          ),
        ),
      ],
    ),
  );
}




  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            margin: EdgeInsets.only(right: 8),
            child: _buildActionButton(
              context,
              'Stok Masuk',
              'assets/images/dashboard/stok_masuk.png',
              () {},
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            margin: EdgeInsets.only(left: 8),
            child: _buildActionButton(
              context,
              'Stok Keluar',
              'assets/images/dashboard/stok_keluar.png',
              () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF22177A),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
