// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:mylesson/core/app_colors.dart';
import 'package:mylesson/data/model/register_user_request.dart';
import 'package:mylesson/data/model/user_response.dart';
import 'package:mylesson/presentation/dashboard/profile/profile_controller.dart';
import 'package:mylesson/presentation/widgets/appbarWidget.dart';
import 'package:mylesson/presentation/widgets/form_field.dart';

class EditProfilePage<C extends ProfileController> extends GetView<C> {
  EditProfilePage({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController sekolahCtrl = TextEditingController();
  TextEditingController kelasCtrl = TextEditingController();
  TextEditingController jenjangCtrl = TextEditingController();
  TextEditingController fotoCtrl = TextEditingController();
  String? _gender;

  initialValue(UserData userData) {
    namaCtrl = TextEditingController(text: userData.userName ?? '');
    emailCtrl = TextEditingController(text: userData.userEmail ?? '');
    sekolahCtrl = TextEditingController(text: userData.userAsalSekolah ?? '');
    kelasCtrl = TextEditingController(text: userData.kelas ?? '');
    jenjangCtrl = TextEditingController(text: userData.jenjang ?? '');
    fotoCtrl = TextEditingController(text: userData.userFoto ?? '');
    _gender = userData.userGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: MainAppbar(title: "Edit Profile")),
        body: buildBody(context),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(100, 40),
              ),
              onPressed: () {
                Get.find<ProfileController>().submitAnswers(UserBody(
                    fullName: namaCtrl.text,
                    email: emailCtrl.text,
                    schoolName: sekolahCtrl.text,
                    schoolLevel: jenjangCtrl.text,
                    schoolGrade: kelasCtrl.text,
                    photoUrl: fotoCtrl.text,
                    gender: _gender.toString()));
              },
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

  Widget buildBody(BuildContext context) {
    // return FormEditProfilePage<C>();
    return Form(
      key: _formKey,
      child: GetX<ProfileController>(
        initState: (_) => Get.find<ProfileController>().getProfile(),
        builder: (controller) {
          UserData userData = controller.userData.value;
          initialValue(userData);
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: <Widget>[
              FormTextFieldWidget(
                title: "Nama Lengkap",
                controller: namaCtrl,
                hintText: "Masukkan Nama Lengkap",
                validation: 'required',
              ),
              FormTextFieldWidget(
                title: "Email",
                controller: emailCtrl,
                hintText: "Masukkan Email",
                validation: 'required',
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: DropdownButtonFormField(
                    value: _gender,
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
                      _gender = value;
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
                title: "Jenjang",
                controller: jenjangCtrl,
                hintText: "Masukkan Jenang Pendidikan",
                validation: 'required',
              ),
              FormTextFieldWidget(
                title: "Kelas",
                controller: kelasCtrl,
                hintText: "Masukkan Kelas",
                validation: 'required',
              ),
              FormTextFieldWidget(
                title: "Nama Sekolah",
                controller: sekolahCtrl,
                hintText: "Masukkan Nama Sekolah",
                validation: 'required',
              ),
              FormTextFieldWidget(
                title: "URL Profil",
                controller: fotoCtrl,
                hintText: "Masukkan Url Foto Profil",
              )
            ],
          );
        },
      ),
    );
  }
}
