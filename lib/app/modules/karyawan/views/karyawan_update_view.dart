import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/karyawan/controllers/karyawan_controller.dart';

class KaryawanUpdateView extends GetView<KaryawanController> {
  const KaryawanUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Karyawan'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.GetDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNokaryawan.text = data['no_karyawan'];
            controller.cNamakaryawan.text = data['nama_karyawan'];
            controller.cJabatankaryawan.text = data['jabatan_karyawan'];

            return Padding(
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
                    onPressed: () => controller.Update(
                      controller.cNokaryawan.text,
                      controller.cNamakaryawan.text,
                      controller.cJabatankaryawan.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
