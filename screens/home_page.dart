import 'package:demo/modal/contact.dart';
import 'package:demo/screens/add_contact.dart';
import 'package:demo/screens/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Contacts> allContact = [];

  @override
  Widget build(BuildContext context) {
    // Object? res = ModalRoute.of(context)!.settings.arguments;
    // if (res == null) {
    // } else {
    //   allContact = res as List<Contacts>;
    //   print(allContact.length);
    //
    //   print("${allContact.length} lenth");
    // }
    //
    // print("${allContact.length} lenth");
    // print("${allContact.length}");
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"), centerTitle: true),
      body: ListView.builder(
        itemCount: allContact.length,
        itemBuilder: (context, i) => Card(
          elevation: 3,
          child: ListTile(
            onTap: () async {
              dynamic data = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(data1: allContact[i])),
              );
              // List<Contacts> data = await Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => AddContact()));
              if (data == 'delete') {
                allContact.remove(allContact[i]);
              } else if (allContact[i] == data) {
              } else {
                allContact[i] = data!;
              }

              setState(() {});
            },
            leading: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
            ),
            title: Text(allContact[i].name),
            subtitle: Text("${allContact[i].phone}"),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.phone),
                color: Colors.green),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Navigator.push( context, MaterialPageRoute( builder: (context) => AddContact(),) ).then((value) => setState(() {}));
            Contacts? data = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContact(),
                ));
            // List<Contacts> data = await Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => AddContact()))
            if (data != null) {
              allContact.add(data);
            }
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }
}
