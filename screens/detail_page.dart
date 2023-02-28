import 'package:flutter/material.dart';

import '../modal/contact.dart';
import 'add_contact.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  Contacts? data1;
  DetailPage({Key? key, required this.data1}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // int i = 0;

  @override
  Widget build(BuildContext context) {
    // widget.data1 = ModalRoute.of(context)!.settings.arguments as Contacts?;
    // if (res != null && i == 0) {
    //   widget.data1 = res;
    //   i++;
    // }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.data1);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () async {
                setState(() {
                  Navigator.pop(context, widget.data1);
                  // i = 0;
                  setState(() {});
                });
              },
              icon: const Icon(Icons.keyboard_backspace)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 60),
                    Container(
                      height: 200,
                      width: 180,
                      decoration: const BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: const Icon(Icons.person_rounded, size: 150),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("You sure to Delete"),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "cancle",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        const SizedBox(width: 10),
                                        ElevatedButton(
                                            onPressed: () {
                                              // res['list']
                                              //     .remove(res['list'][res['id']]);
                                              // HomePage().allContact.remove(res);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Contact Delete Successfully..."),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor: Colors.red,
                                              ));
                                              Navigator.of(context).pop();
                                              Navigator.pop(context, "delete");

                                              // Navigator.of(context)
                                              //     .pop(res['list']);

                                              // Navigator.of(context)
                                              //     .pushNamedAndRemoveUntil(
                                              //         '/', (route) => false,
                                              //         arguments: res['list']);
                                            },
                                            child: const Text(
                                              "Yes",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                      ],
                                    ));
                          });
                        },
                        icon: const Icon(Icons.delete)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("You sure to Update"),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "cancle",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        const SizedBox(width: 10),
                                        ElevatedButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();

                                              Contacts data =
                                                  await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddContact(),
                                                    settings: RouteSettings(
                                                      arguments: widget.data1,
                                                    )),
                                              );
                                              // print(data.name);
                                              widget.data1 = data;
                                              // print(data1!.name);
                                              setState(() {});
                                            },
                                            child: const Text(
                                              "Yes",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                      ],
                                    ));
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        )),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(widget.data1!.name, style: titleStyle),
                ),
                const Divider(color: Colors.black, thickness: 4),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("${widget.data1!.phone}", style: titleStyle),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.phone, color: Colors.green)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message, color: Colors.blue)),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.black, thickness: 4),
                const SizedBox(height: 10),
                Text("Email id : ${widget.data1!.email}", style: titleStyle),
                const SizedBox(height: 30),
                Text("Addess  : ${widget.data1!.address}", style: titleStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
