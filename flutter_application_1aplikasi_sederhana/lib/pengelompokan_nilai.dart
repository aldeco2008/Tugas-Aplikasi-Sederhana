import 'package:flutter/material.dart';

void main() {
  runApp(PengelompokanNilai());
}

class PengelompokanNilai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengelompokan Nilai Siswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  String _kategori = '';

  void _hitungKategori() {
    final String input1 = _controller1.text;
    final String input2 = _controller2.text;
    final String input3 = _controller3.text;
    final String input4 = _controller4.text;
    final String input5 = _controller5.text;

    final int? nilai1 = int.tryParse(input1);
    final int? nilai2 = int.tryParse(input2);
    final int? nilai3 = int.tryParse(input3);
    final int? nilai4 = int.tryParse(input4);
    final int? nilai5 = int.tryParse(input5);

    if (nilai1 == null || nilai1 < 0 || nilai1 > 100 ||
        nilai2 == null || nilai2 < 0 || nilai2 > 100 ||
        nilai3 == null || nilai3 < 0 || nilai3 > 100 ||
        nilai4 == null || nilai4 < 0 || nilai4 > 100 ||
        nilai5 == null || nilai5 < 0 || nilai5 > 100) {
      _showErrorDialog('Masukkan nilai siswa antara 0 sampai 100');
      return;
    }

    final double rataRata = (nilai1 + nilai2 + nilai3 + nilai4 + nilai5) / 5;

    String kategori;
    if (rataRata >= 85) {
      kategori = 'A';
    } else if (rataRata >= 70) {
      kategori = 'B';
    } else if (rataRata >= 55) {
      kategori = 'C';
    } else {
      kategori = 'D';
    }

    setState(() {
      _kategori = 'Kategori Nilai: $kategori';
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa 3',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa 4',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller5,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa 5',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungKategori,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text(
              _kategori,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
