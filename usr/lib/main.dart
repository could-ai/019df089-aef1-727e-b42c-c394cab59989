import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MDC Smart Audit Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5), // Tema warna biru
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
      },
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // Mengecek apakah ukuran layar cukup lebar untuk menampilkan sidebar
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: isDesktop ? null : const AppSidebar(),
      body: Row(
        children: [
          if (isDesktop) const AppSidebar(),
          Expanded(
            child: Column(
              children: [
                const AppHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        MetricsSection(),
                        SizedBox(height: 24),
                        MainContentSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'MDC Smart Audit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E88E5),
              ),
            ),
          ),
          _buildNavItem(Icons.dashboard, 'Dashboard', true),
          _buildNavItem(Icons.assignment, 'Audit', false),
          _buildNavItem(Icons.bar_chart, 'Laporan', false),
          _buildNavItem(Icons.warning, 'Peringatan', false),
          const Spacer(),
          _buildNavItem(Icons.settings, 'Pengaturan', false),
          _buildNavItem(Icons.logout, 'Keluar', false),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, bool isActive) {
    return Container(
      color: isActive ? Colors.blue.withOpacity(0.1) : Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.blue : Colors.grey[600]),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey[800],
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      color: Colors.white,
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.menu),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          const Text(
            'Ikhtisar Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // Search bar disembunyikan di layar kecil
          if (MediaQuery.of(context).size.width > 500)
            Container(
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  hintText: 'Cari...',
                ),
              ),
            ),
          const SizedBox(width: 24),
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class MetricsSection extends StatelessWidget {
  const MetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount = constraints.maxWidth > 800
          ? 4
          : (constraints.maxWidth > 500 ? 2 : 1);
      return GridView.count(
        crossAxisCount: crossAxisCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
        children: [
          _buildMetricCard(
              'Total Audit', '1,245', Icons.assignment, Colors.blue),
          _buildMetricCard(
              'Lolos', '856', Icons.check_circle, Colors.green),
          _buildMetricCard('Gagal', '234', Icons.cancel, Colors.red),
          _buildMetricCard(
              'Peringatan', '155', Icons.warning, Colors.orange),
        ],
      );
    });
  }

  Widget _buildMetricCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MainContentSection extends StatelessWidget {
  const MainContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(flex: 2, child: ChartSection()),
          SizedBox(width: 24),
          Expanded(flex: 1, child: WarningsSection()),
        ],
      );
    } else {
      return Column(
        children: const [
          ChartSection(),
          SizedBox(height: 24),
          WarningsSection(),
        ],
      );
    }
  }
}

class ChartSection extends StatelessWidget {
  const ChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aktivitas Audit',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar(120, 'Sen'),
                _buildBar(180, 'Sel'),
                _buildBar(140, 'Rab'),
                _buildBar(210, 'Kam'),
                _buildBar(160, 'Jum'),
                _buildBar(90, 'Sab'),
                _buildBar(110, 'Min'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double height, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class WarningsSection extends StatelessWidget {
  const WarningsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Peringatan Terbaru',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildWarningItem('Pelanggaran keamanan di Zona A', '2 jam lalu', Colors.red),
          _buildWarningItem('Perawatan alat produksi dibutuhkan', '5 jam lalu', Colors.orange),
          _buildWarningItem('Jadwal audit terlewat di divisi HR', '1 hari lalu', Colors.orange),
          _buildWarningItem('Alat pemadam api kadaluarsa', '1 hari lalu', Colors.red),
          _buildWarningItem('Formulir inspeksi tidak lengkap', '2 hari lalu', Colors.amber),
        ],
      ),
    );
  }

  Widget _buildWarningItem(String text, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
