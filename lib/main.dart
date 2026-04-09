import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopee Slicing',
      theme: ThemeData(
        primaryColor: const Color(0xFFEE4D2D),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const ShopeeHomePage(),
    );
  }
}

class ShopeeHomePage extends StatefulWidget {
  const ShopeeHomePage({Key? key}) : super(key: key);

  @override
  State<ShopeeHomePage> createState() => _ShopeeHomePageState();
}

class _ShopeeHomePageState extends State<ShopeeHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildShopeeAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildBannerSection(),
            Transform.translate(
              offset: const Offset(0, -10),
              child: _buildWalletSection(),
            ),
            _buildMenuSection(),
            const SizedBox(height: 8),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFEE4D2D),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.thumb_up_alt_outlined), activeIcon: Icon(Icons.thumb_up), label: 'Rekomendasi'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), activeIcon: Icon(Icons.storefront), label: 'Mall'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), activeIcon: Icon(Icons.play_circle_fill), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), activeIcon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Saya'),
        ],
      ),
    );
  }

  Widget _buildShopeeAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFEE4D2D),
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari barang...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 9),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          const SizedBox(width: 16),
          const Icon(Icons.chat_outlined, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildBannerSection() {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: Image.asset('assets/images/promo.jpg', fit: BoxFit.cover),
    );
  }

  Widget _buildWalletSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildWalletItem(Icons.qr_code_scanner, 'Scan'),
          Container(height: 30, width: 1, color: Colors.grey[300]),
          _buildWalletItem(Icons.account_balance_wallet, 'Rp150.000'),
          Container(height: 30, width: 1, color: Colors.grey[300]),
          _buildWalletItem(Icons.monetization_on, '1.500 Koin'),
          Container(height: 30, width: 1, color: Colors.grey[300]),
          _buildWalletItem(Icons.send_to_mobile, 'Transfer'),
        ],
      ),
    );
  }

  Widget _buildWalletItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 20, color: const Color(0xFFEE4D2D)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildMenuSection() {
    final List<Map<String, dynamic>> menus = [
      {'title': 'Gratis Ongkir\n& Voucher', 'icon': Icons.local_shipping, 'color': Colors.green[100], 'iconColor': Colors.green},
      {'title': 'Shopee Video', 'icon': Icons.play_circle_fill, 'color': Colors.orange[100], 'iconColor': Colors.orange},
      {'title': 'Shopee Live', 'icon': Icons.videocam, 'color': Colors.red[100], 'iconColor': Colors.red},
      {'title': 'Shopee Mall', 'icon': Icons.storefront, 'color': Colors.red[50], 'iconColor': Colors.red[800]},
      {'title': 'Pulsa & Tagihan', 'icon': Icons.phone_android, 'color': Colors.cyan[100], 'iconColor': Colors.cyan},
      {'title': 'ShopeeFood', 'icon': Icons.fastfood, 'color': Colors.orange[100], 'iconColor': Colors.orange[800]},
      {'title': 'Supermarket', 'icon': Icons.shopping_basket, 'color': Colors.green[100], 'iconColor': Colors.green[700]},
      {'title': 'Shopee Barokah', 'icon': Icons.mosque, 'color': Colors.teal[100], 'iconColor': Colors.teal},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Wrap(
        spacing: 12,
        runSpacing: 16,
        alignment: WrapAlignment.spaceAround,
        children: menus.map((menu) {
          return SizedBox(
            width: 75,
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: menu['color'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(menu['icon'], color: menu['iconColor']),
                ),
                const SizedBox(height: 8),
                Text(
                  menu['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductGrid() {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Sepatu Sneakers Pria Kasual Original',
        'price': 'Rp 120.000',
        'sold': '10rb+',
        'image': 'assets/images/sepatu sneakers.jpg',
      },
      {
        'name': 'Tas Ransel Wanita / Backpack Fashion',
        'price': 'Rp 85.000',
        'sold': '5,2rb',
        'image': 'assets/images/tas wanita.jpg',
      },
      {
        'name': 'Jam Tangan Digital Anti Air Pria/Wanita',
        'price': 'Rp 45.000',
        'sold': '1,1rb',
        'image': 'assets/images/jam tangan.png',
      },
      {
        'name': 'Kemeja Flanel Kotak-Kotak Lengan Panjang',
        'price': 'Rp 95.000',
        'sold': '800',
        'image': 'assets/images/kemeja.jpg',
      },
      {
        'name': 'Botol Minum Tumbler Stainless Steel 500ml',
        'price': 'Rp 35.000',
        'sold': '3,5rb',
        'image': 'assets/images/tumbler.jpg',
      },
      {
        'name': 'Headset Bluetooth TWS Earphone V5.0',
        'price': 'Rp 150.000',
        'sold': '20rb+',
        'image': 'assets/images/tws.jpg',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.68,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2,
            color: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      child: Image.asset(product['image'], fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['price'],
                        style: const TextStyle(
                          color: Color(0xFFEE4D2D),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            '4.8 | Terjual ${product['sold']}',
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}