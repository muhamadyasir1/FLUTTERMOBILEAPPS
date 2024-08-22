import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah Tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMK Negeri 4 - Mobile Apps'),
          backgroundColor: Color.fromARGB(123, 141, 247, 160),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: 'Dashboard'),
              Tab(icon: Icon(Icons.people), text: 'Users'),
              Tab(icon: Icon(Icons.person), text: 'Profil'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DashboardTab(),
            UsersTab(),
            ProfilTab(),
          ],
        ),
      ),
    );
  }
}

// Layout untuk Tab Dashboard
class DashboardTab extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [ 
    {'icon': Icons.school, 'label': 'Jrusan', 'color': Colors.greenAccent}, 
    {'icon': Icons.medical_services, 'label': 'Layanan Kesehatan', 'color': Colors.red[100]}, 
    {'icon': Icons.social_distance, 'label': 'Sosial Media', 'color': Colors.green[100]}, 
    {'icon': Icons.group_work, 'label': 'Ekstrakurikuler', 'color': Colors.orange[100]}, 
    {'icon': Icons.map, 'label': 'Denah Kelas', 'color': Colors.purple[100]},
    {'icon': Icons.library_books, 'label': 'LMS Smkn 4 Bogor', 'color': Colors.teal[100]}, 
    {'icon': Icons.feedback, 'label': 'Saran dan Kritik', 'color': Colors.amber[100]},
    {'icon': Icons.schedule, 'label': 'Jadwal KBM', 'color': Colors.cyan[100]}, 
    {'icon': Icons.map, 'label': 'Peta Sekolah', 'color': Colors.indigo[100]}, 
    {'icon': Icons.warning, 'label': 'Laporan Keluhan Siswa', 'color': Color.fromARGB(255, 232, 106, 244)}, 
    {'icon': Icons.phone, 'label': 'Kontak Sekolah', 'color': Colors.pink[100]}, 
    {'icon': Icons.info, 'label': 'Info Sekolah', 'color': Color.fromARGB(255, 138, 241, 220)}, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Jumlah item per baris
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 15.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () {
                // Tangani ketukan pada ikon menu
                print('${item['label']} tapped');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 50.0, color: Colors.black), 
                    SizedBox(height: 8.0),
                    Text(
                      item['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Layout untuk Tab User
class UsersTab extends StatelessWidget {
  final List<User> users = [
    User(firstName: 'Adam Ramdani F', email: 'Kelas : 12 PPLG 1'),
    User(firstName: 'M. Abrisham Abdullah', email: 'Kelass : 12 PPLG 1'),
    User(firstName: 'Fatur Rachman', email: 'Kelas : 12 PPLG 2'),
    User(firstName: 'Terry Leon', email: 'Kelas : 12 PPLG 3'),
    User(firstName: 'Charly Almasih Almahdi', email: 'Kelas : 11 PPLG 2'),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar belakang putih
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.firstName),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}

// Layout untuk Tab Profil
class ProfilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(6, 239, 252, 249), // Warna latar belakang biru
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('profileyasir.jpg'), 
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Muhamad Yasir',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Email: yasirrraja341@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Biodata',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Nama Lengkap'),
              subtitle: Text('Muhamad Yasir'),
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Tanggal Lahir'),
              subtitle: Text('27 September 2006'),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  final String firstName;
  final String email;

  User({required this.firstName, required this.email});
}