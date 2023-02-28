import 'package:demo/modal/contact.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

TextStyle titleStyle = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.visible);

class _AddContactState extends State<AddContact> {
  final GlobalKey<FormState> formColnroller = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //dynamic? res = ModalRoute.of(context)!.settings.arguments ?? null;
  }

  @override
  Widget build(BuildContext context) {
    Contacts? res = ModalRoute.of(context)!.settings.arguments as Contacts?;
    if (res != null) {
      nameController.text = res.name;
      phoneController.text = res.phone.toString();
      emailController.text = res.email;
      addressController.text = res.address;
    }

    // print(res!['id']);
    return Scaffold(
      appBar: AppBar(
          title:
              (res != null) ? const Text("Edite") : const Text("Contact Info"),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formColnroller,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: titleStyle),
                const SizedBox(height: 10),
                TextFormField(
                    controller: nameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Valid Name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Name")),
                const SizedBox(height: 20),
                Text("phone Number", style: titleStyle),
                const SizedBox(height: 10),
                TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Valid phone Number";
                      }
                      // if(val!.){}
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your phone Number")),
                const SizedBox(height: 20),
                Text("Emai Id", style: titleStyle),
                const SizedBox(height: 10),
                TextFormField(
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Valid Emai Id";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Emai Id")),
                const SizedBox(height: 20),
                Text("Address", style: titleStyle),
                const SizedBox(height: 10),
                TextFormField(
                    controller: addressController,
                    maxLines: 3,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Valid Address";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Address")),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (formColnroller.currentState!.validate()) {
                          setState(() {
                            if (res != null) {
                              // int i = res!['list']
                              //     .indexOf(res!['list'][res!['id']]);

                              Contacts c1 = Contacts(
                                  address: addressController.text,
                                  email: emailController.text,
                                  name: nameController.text,
                                  phone: int.parse(phoneController.text));
                              // allContact[i] = c1;
                              // res!['list'][i] = c1;
                              Navigator.pop(context, c1);
                              setState(() {});
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     '/', (route) => false,
                              //     arguments: res!['list']);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("Contact Update Successfully...."),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ));
                            } else {
                              Contacts c1 = Contacts(
                                  address: addressController.text,
                                  email: emailController.text,
                                  name: nameController.text,
                                  phone: int.parse(phoneController.text));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Contact Add Successfully...."),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ));

                              Navigator.pop(context, c1);
                            }
                          });
                        }
                      },
                      child: (res != null)
                          ? const Text("Update Now")
                          : const Text("Add Contact")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
