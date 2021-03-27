import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/user/model/provider_class.dart';
import 'package:resume/user/widgets/chat_widgets.dart';
import '../widgets/container_bottom_sheet.dart';

class SkillsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<GetListView>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0DA2A6),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "اختر المهارات",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
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
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "رجوع",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "اختر من القائمة المهارات",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0DA2A6)),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(child: SizedBox()),
                  Expanded(child: SizedBox()),
                ],
              ),
              Column(
                children: [
                  ContainerBottomSheet(
                    text: 'Java',
                    onTap: () {
                      myProvider.removeFromList();
                      myProvider.addToList([
                        chooseFromListFacultyInactive(),
                        chosenOptionCard(
                          'Java',
                        ),
                        lastReply()
                      ]);
                      Navigator.of(context).pop();
                    },
                  ),
                  ContainerBottomSheet(
                    text: 'C#',
                    onTap: () {
                      myProvider.removeFromList();
                      myProvider.addToList([
                        chooseFromListFacultyInactive(),
                        chosenOptionCard(
                          'C#',
                        ),
                        lastReply()
                      ]);
                      Navigator.of(context).pop();
                    },
                  ),
                  ContainerBottomSheet(
                    text: 'PHP',
                    onTap: () {
                      myProvider.removeFromList();
                      myProvider.addToList([
                        chooseFromListFacultyInactive(),
                        chosenOptionCard(
                          'PHP',
                        ),
                        lastReply()
                      ]);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

