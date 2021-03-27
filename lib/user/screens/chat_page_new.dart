import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/provider_class.dart';

class ChatPageNew extends StatefulWidget {
  @override
  _ChatPageNewState createState() => _ChatPageNewState();
}

class _ChatPageNewState extends State<ChatPageNew> {
  ScrollController scrollController = new ScrollController();
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (scrollController.hasClients) {
  //       scrollController.jumpTo(scrollController.position.maxScrollExtent);
  //     }
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GetListView>(context);
    //----------------------------------------------------------------------
    return WillPopScope(
      onWillPop: () async {
        myProvider.myListView.clear();
        Navigator.pop(context);
        return null;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff0DA2A6),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "ChatBot Page",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: Color(0xff0DA2A6),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Color(0xffF3F3F3),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: myProvider.myListView.length,
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (context, index) {
                      return myProvider.myListView[index];
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
