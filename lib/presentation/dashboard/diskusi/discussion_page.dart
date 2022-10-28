// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylesson/presentation/dashboard/diskusi/discussion_controller.dart';
import 'package:mylesson/presentation/widgets/appbarWidget.dart';
import 'package:mylesson/presentation/widgets/chat_item_widget.dart';
import 'package:mylesson/presentation/widgets/input_chat_widget.dart';

class DiscussionPage extends StatelessWidget {
  DiscussionPage({Key? key}) : super(key: key);
  final chatC = Get.find<DiscussionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: MainAppbar(
            title: 'Diskusi Soal',
          )),
      body: buildBody(context),
      bottomNavigationBar: buildBottom(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(() {
      if (chatC.isLoadingMessages) {
        return buildLoading(context);
      }

      return buildData(context);
    });
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget buildData(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final chat = chatC.messages[index];
        return ChatItemWidget(chat: chat);
      },
      itemCount: chatC.messages.length,
      reverse: true,
    );
  }

  Widget buildBottom(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Card(
      elevation: 16,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: InputChatWidget(
          onTapAdd: () => onTapAdd(context),
          onTapCamera: () => onTapCamera(context),
          onTapSend: () => onSend(context),
        ),
      ),
    );
  }

  void onTapCamera(BuildContext context) {
    chatC.openCamera();
  }

  void onSend(BuildContext context) {
    final fileName = chatC.selectedFile?.name;
    debugPrint(fileName);
  }

  void onTapAdd(BuildContext context) {
    debugPrint(chatC.messageLength.toString());
  }
}
