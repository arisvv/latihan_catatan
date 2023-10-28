import 'package:catatan/catatan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CatatanPage(),
    );
  }
}

class CatatanPage extends StatefulWidget {
  const CatatanPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => CatatanState();
}

TextEditingController judul = TextEditingController();
TextEditingController catatanCtrl = TextEditingController();

class CatatanState extends State<CatatanPage> {
  List<Catatan> catatan = Catatan.dataDummy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan Pagi"),
        backgroundColor: Color.fromARGB(0, 45, 109, 247),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: judul,
              decoration: const InputDecoration(hintText: "Judul.."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: catatanCtrl,
              decoration: const InputDecoration(hintText: "Catatan.."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        clearForm();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 221, 31, 47)),
                    child: const Text("Clear"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    if (judul.text != '' && catatanCtrl.text != '') {
                      setState(() {
                        catatan.add(Catatan(judul.text, catatanCtrl.text));
                        clearForm();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(69, 3, 43, 99)),
                  child: const Text("Submit"),
                )),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: catatan.length,
            itemBuilder: (context, index) {
              return Container(
                color: const Color.fromARGB(0, 168, 218, 220),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(catatan[index].judul,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      Text(catatan[index].isi,
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                      const SizedBox(height: 8.0)
                    ]),
              );
            },
          ))
        ],
      ),
    );
  }

  void clearForm() {
    judul.text = '';
    catatanCtrl.text = '';
  }
}
