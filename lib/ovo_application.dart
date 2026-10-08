import 'package:flutter/material.dart';

void main() {
  runApp(const OvoApp());
}

class OvoApp extends StatelessWidget {
  const OvoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OVO',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainPage(),
    );
  }
}

// Main Page
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    FinancePage(),
    PayPage(),
    InboxPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff5426c9),
        unselectedItemColor: const Color(0xff999999),
        backgroundColor: Colors.white,
        elevation: 8,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 25,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_rounded,
              size: 25,
            ),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xff8b4be9),
                    Color(0xff4020c5),
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  'QRIS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_rounded,
                  size: 25,
                ),
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '36',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Inbox',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 25,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

//HOme
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xffc9c1ed),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              _ovoCash(),
              const SizedBox(height: 15),
              _verification(),
              const SizedBox(height: 15),
              _services(),
              const SizedBox(height: 15),
              _banner(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Header
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 12, 22, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'OVO',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300,
              letterSpacing: -2,
              color: Color(0xff5527c9),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffded8f7),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.local_offer_rounded,
                  color: Color(0xff582ac9),
                  size: 20,
                ),
                SizedBox(width: 6),
                Text(
                  'Promo',
                  style: TextStyle(
                    color: Color(0xff582ac9),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Ovo Cash
  Widget _ovoCash() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(20),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff497cdb),
            Color(0xff553ac7),
            Color(0xff4689d9),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OVO Cash',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'Total Saldo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.visibility_outlined,
                color: Colors.white70,
                size: 17,
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tap untuk lihat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: Color(0xff5a2dcb),
                      size: 17,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'OVO Points',
                      style: TextStyle(
                        color: Color(0xff5a2dcb),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _action(Icons.add_circle, 'Top Up'),
              _action(Icons.arrow_upward_rounded, 'Transfer'),
              _action(Icons.arrow_downward_rounded, 'Tarik Tunai'),
              _action(Icons.menu_rounded, 'History'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _action(IconData icon, String title) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 27,
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  // Verification
  Widget _verification() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(17),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffffd56d),
                ),
                child: const Icon(
                  Icons.track_changes,
                  size: 34,
                  color: Color(0xff5a2bc9),
                ),
              ),
              const SizedBox(width: 13),
              const Expanded(
                child: Text(
                  'Cek data kamu demi kelancaran\n'
                  'pemakaian akun OVO Premier kamu',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 110,
              padding: const EdgeInsets.symmetric(
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff5727d4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'Cek',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Services
  Widget _services() {
    final services = [
      ['Nabung by\nSuperbank', Icons.savings, 'BARU'],
      ['Pinjaman', Icons.account_balance_wallet, '100JT'],
      ['Uang\nElektronik', Icons.credit_card, 'Rp 1'],
      ['Angsuran\nKredit', Icons.receipt_long, ''],
      ['Pulsa/Paket\nData', Icons.phone_android, 'PROMO'],
      ['PLN', Icons.flash_on, 'PROMO'],
      ['Air PDAM', Icons.water_drop, ''],
      ['Internet &\nTV Kabel', Icons.tv, ''],
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(
        12,
        10,
        12,
        12,
      ),
      child: Column(
        children: [
          // TAB
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: _tab(
                      'Favorit',
                      true,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: _tab(
                      'Finansial',
                      false,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: _tab(
                      'Hiburan',
                      false,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: _tab(
                      'Pilihan Lain',
                      false,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // JARAK TAB KE MENU
          const SizedBox(height: 8),

          // MENU
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 0,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              return _service(
                services[index][0] as String,
                services[index][1] as IconData,
                services[index][2] as String,
              );
            },
          ),
        ],
      ),
    );
  }

  // TAB
  Widget _tab(
    String text,
    bool active,
  ) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xfff1edfa)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: active
              ? const Color(0xff5727cc)
              : const Color(0xff999999),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

 //Services
  Widget _service(
    String title,
    IconData icon,
    String badge,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfff1eaff),
              ),
              child: Icon(
                icon,
                size: 32,
                color: const Color(0xff6832cf),
              ),
            ),
            if (badge.isNotEmpty)
              Positioned(
                top: -7,
                left: -7,
                right: -7,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffff3b35),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    badge,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            height: 1.25,
            color: Color(0xff222222),
          ),
        ),
      ],
    );
  }

  // Banner
  Widget _banner() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: const LinearGradient(
          colors: [
            Color(0xff5727cc),
            Color(0xff4820b7),
          ],
        ),
      ),
      child: const Center(
        child: Text(
          'KrediOne\nLimit Pinjaman hingga',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//Profile
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            18,
            20,
            18,
            25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff171717),
                ),
              ),

              const SizedBox(height: 22),

              // PROFILE CARD
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffdedede),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffeee8ff),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 32,
                        color: Color(0xff5a2cc9),
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nata Parahita',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '0856-4933-5474',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Text(
                      'Ubah',
                      style: TextStyle(
                        color: Color(0xff1674d1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Loyalty 
              Container(
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffdedede),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: 38,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Loyalty Code',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                'Akun',
                style: TextStyle(
                  color: Color(0xff342b48),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _profileItem(
                Icons.track_changes,
                'OVO Premier',
                button: 'Upgrade',
              ),

              _profileItem(
                Icons.account_balance_wallet,
                'OVO Points',
              ),

              _profileItem(
                Icons.star,
                'OVO Stamp',
              ),

              _profileItem(
                Icons.link,
                'Aplikasi Terhubung',
                badge: 'NEW',
              ),

              const SizedBox(height: 25),

              const Text(
                'Bantuan',
                style: TextStyle(
                  color: Color(0xff342b48),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              _profileItem(
                Icons.help,
                'Pusat Bantuan',
              ),

              const SizedBox(height: 25),

              const Text(
                'Keamanan',
                style: TextStyle(
                  color: Color(0xff342b48),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              _profileItem(
                Icons.lock_outline,
                'Keamanan Akun',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileItem(
    IconData icon,
    String title, {
    String? button,
    String? badge,
  }) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffe5e5e5),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
            color: const Color(0xff242424),
          ),

          const SizedBox(width: 17),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          if (button != null)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff5826d5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                button,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          if (badge != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffff2850),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.chevron_right,
              size: 25,
            ),
          ] else if (button == null)
            const Icon(
              Icons.chevron_right,
              size: 25,
            ),
        ],
      ),
    );
  }
}

// Finance
class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Finance',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}

//Pay
class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'QRIS',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}

// Inbox
class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Inbox',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}