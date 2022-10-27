// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mylesson/core/app_colors.dart';
import 'package:mylesson/core/validation.dart';
import 'package:mylesson/presentation/widgets/appbarWidget.dart';

import '../../widgets/form_field.dart';

class RegistFormPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegistFormPage({Key? key}) : super(key: key);

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController sekolahCtrl = TextEditingController();
  String jenisKelamin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: MainAppbar(title: "Yuk isi data diri!")),
        body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: <Widget>[
              FormTextFieldWidget(
                title: "Email",
                controller: emailCtrl,
                hintText: "Masukkan Email",
                validation: 'required',
              ),
              FormTextFieldWidget(
                title: "Nama Lengkap",
                controller: namaCtrl,
                hintText: "Masukkan Nama Lengkap",
                validation: 'required',
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: DropdownButtonFormField(
                    value: "Laki-laki",
                    // ignore: prefer_const_literals_to_create_immutables
                    items: [
                      DropdownMenuItem(
                          child: Text("Laki-laki"), value: "Laki-laki"),
                      DropdownMenuItem(
                        child: Text("Perempuan"),
                        value: "Perempuan",
                      )
                    ],
                    onChanged: (value) {
                      print("You selected $value");
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        labelText: "Jenis Kelamin",
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.3)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  )),
              FormTextFieldWidget(
                title: "Kelas",
                controller: sekolahCtrl,
                hintText: "Masukkan Kelas",
                validation: 'required',
              ),
              FormTextFieldWidget(
                title: "Nama Sekolah",
                controller: sekolahCtrl,
                hintText: "Masukkan Nama Sekolah",
                validation: 'required',
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(100, 40), //////// HERE
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.save_as,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Simpan",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )));
  }
}
