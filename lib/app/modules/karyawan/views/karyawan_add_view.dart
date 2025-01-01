import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/karyawan/controllers/karyawan_controller.dart';

class KaryawanAddView extends GetView<KaryawanController> {
  const KaryawanAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNokaryawan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "no_karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNamakaryawan,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "nama_karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cJabatankaryawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "jabatan_karyawan"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNokaryawan.text,
                controller.cNamakaryawan.text,
                controller.cJabatankaryawan.text,
              ),
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
