import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProdukScreen extends StatefulWidget {
  @override
  _AddProdukScreenState createState() => _AddProdukScreenState();
}

class _AddProdukScreenState extends State<AddProdukScreen> {
  String? selectedCategory;
  final List<String> categories = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
  bool _isFormValid = false;

  final TextEditingController kodeBarangController = TextEditingController();
  final TextEditingController namaBarangController = TextEditingController();
  final TextEditingController komentarController = TextEditingController();
  final TextEditingController opsiSatuanController = TextEditingController();
  final TextEditingController perSatuanController = TextEditingController();
  final TextEditingController stokRendahController = TextEditingController();
  final TextEditingController stokAwalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    kodeBarangController.addListener(_validateForm);
    namaBarangController.addListener(_validateForm);
    opsiSatuanController.addListener(_validateForm);
    perSatuanController.addListener(_validateForm);
    stokRendahController.addListener(_validateForm);
    stokAwalController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid = kodeBarangController.text.isNotEmpty &&
          namaBarangController.text.isNotEmpty &&
          opsiSatuanController.text.isNotEmpty &&
          perSatuanController.text.isNotEmpty &&
          stokRendahController.text.isNotEmpty &&
          stokAwalController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    kodeBarangController.removeListener(_validateForm);
    namaBarangController.removeListener(_validateForm);
    opsiSatuanController.removeListener(_validateForm);
    perSatuanController.removeListener(_validateForm);
    stokRendahController.removeListener(_validateForm);
    stokAwalController.removeListener(_validateForm);
    
    kodeBarangController.dispose();
    namaBarangController.dispose();
    komentarController.dispose();
    opsiSatuanController.dispose();
    perSatuanController.dispose();
    stokRendahController.dispose();
    stokAwalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        '../assets/images/produk/add/back.png',
                        width: 45,
                        height: 27,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Text(
                      'Tambah Barang',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  width: 66,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3E0),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Image.asset(
                    '../assets/images/produk/add/Camera.png',
                    width: 55,
                    height: 55,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormField('Kode Barang', kodeBarangController, isRequired: true),
                    _buildFormField('Nama Barang', namaBarangController, isRequired: true),
                    _buildFormField('Komentar', komentarController),
                    _buildDropdownField('Pilih Kategori'),
                    
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormField('Opsi Satuan', opsiSatuanController, isRequired: true),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildFormField('Per Satuan', perSatuanController, isRequired: true),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormField('Stok Rendah', stokRendahController, isRequired: true),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildFormField('Stok Awal', stokAwalController, isRequired: true),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        onPressed: _isFormValid
                            ? () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              '../assets/images/success_icon.png',
                                              width: 100,
                                              height: 100,
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              'Produk Berhasil Ditambahkan',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 45,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Kembali',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(0xFF1F41BB),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                elevation: 8,
                                                shadowColor: Color(0xFF1F41BB).withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            : null,
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          alignment: Alignment.center,
                          child: Text(
                            'Tambah',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFormValid ? Color(0xFF1F41BB) : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: _isFormValid ? 8 : 0,
                          shadowColor: _isFormValid ? Color(0xFF1F41BB).withOpacity(0.5) : Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, {bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
            if (isRequired)
              Text(
                '*',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          height: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFF1F41BB),
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFF1F41BB),
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Pilih Kategori',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
