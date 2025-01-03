import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KaryawanController extends GetxController {
  //TODO: Implement pegawaiController
  late TextEditingController cNokaryawan;
  late TextEditingController cNamakaryawan;
  late TextEditingController cJabatankaryawan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan = firestore.collection('karyawan_22312078');
    return karyawan.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference karyawan = firestore.collection('karyawan_22312078');
    return karyawan.snapshots();
  }

  void add(
      String no_karyawan, String nama_karyawan, String jabatan_karyawan) async {
    CollectionReference karyawan_22312078 =
        firestore.collection("karyawan_22312078");

    try {
      await karyawan_22312078.add({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data karyawan",
          onConfirm: () {
            cNokaryawan.clear();
            cNamakaryawan.clear();
            cJabatankaryawan.clear();
            Get.back();
            Get.back();
            Get.back();
          },
          textConfirm: "OK");
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef =
        firestore.collection("karyawan_22312078").doc(id);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan,
      String id) async {
    DocumentReference karyawan_22312078ById =
        firestore.collection("karyawan_22312078").doc(id);

    try {
      await karyawan_22312078ById.update({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data karyawan.",
        onConfirm: () {
          cNokaryawan.clear();
          cNamakaryawan.clear();
          cJabatankaryawan.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Mengubah karyawan.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef =
        firestore.collection("karyawan_22312078").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    cNokaryawan = TextEditingController();
    cNamakaryawan = TextEditingController();
    cJabatankaryawan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNokaryawan.dispose();
    cNamakaryawan.dispose();
    cJabatankaryawan.dispose();
    super.onClose();
  }
}
