import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}


Future sendEmail(
    String drName,
    String name,
    String userEmailID,
    String age,
    String gender,
    String dob,
    String timing,

    ) async {
  const serviceId = 'service_c34mz9u';
  const templateId = 'template_qbzebsl';
  const userId = 'ibOOHsJvT8xmzxFYd';
  const accessTokenKey = '5uXdiHHpNFUDFIWauLTJv';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final response = await http.post(url,
    headers: {
      'type': 'POST',
      'Content-type': 'application/json'
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'accessToken': accessTokenKey,
      'template_params': {
        'doctor_name': drName,
        'name': name,
        'age': age,
        'gender': gender,
        'dob': dob,
        'time': timing,
        'user_email':  userEmailID
      }
    })
  );

  return response.statusCode;
}

class _AppointmentPageState extends State<AppointmentPage> {

  final _key = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final DrNameController = TextEditingController();
  final timeController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final DOBController = TextEditingController();

  var valueChoose;

  List listItem = [
    "Dr. V. R. Sharma",
    "Dr. Astana",
    "Dr. Sachin Mishra",
    "Dr. Priya Mane"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Appointment'),
        backgroundColor: Colors.teal,

      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _key,
                  child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey  ,width:1),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: DropdownButton(
                            hint: const Text("Select Doctor : "),
                            icon: const Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            underline: const SizedBox(),
                            value:valueChoose,
                            onChanged: (newValue) {
                              setState(() {
                                valueChoose = newValue;
                                DrNameController.text = newValue.toString();
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem)
                              );
                            }).toList(),
                          ),
                        ),

                        const SizedBox(height:30),

                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  labelText: "Name",
                                  hintText: "Enter Your Name",
                                  prefixIcon: Icon(Icons.person),
                                  border:OutlineInputBorder(),

                              ),

                              onChanged: (String value){

                              },
                              validator: (value){
                                return value!.isEmpty ? "Please Enter Name" : null;
                              },
                            ),
                        const SizedBox(height:30),

                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  labelText: "Email",
                                  hintText: "Enter Your Email",
                                  prefixIcon: Icon(Icons.email),
                                  border:OutlineInputBorder(),

                              ),

                              onChanged: (String value){

                              },
                              validator: (value){
                                return value!.isEmpty ? "Please Enter Email" : null;
                              },
                            ),


                        const SizedBox(height:30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 130,
                              child: TextFormField(
                                controller: ageController,
                                decoration: const InputDecoration(
                                    labelText: "Age",
                                    hintText: "Enter Your Age",
                                    prefixIcon: Icon(Icons.numbers),
                                    border:OutlineInputBorder(),

                                ),

                                onChanged: (String value){

                                },
                                validator: (value){
                                  return value!.isEmpty ? "Please Enter age" : null;
                                },
                              ),
                            ),

                        SizedBox(
                          width: 130,
                          child: TextFormField(
                            controller: genderController,
                              decoration: const InputDecoration(
                              labelText: "Gender",
                              hintText: "Enter Your Gender",
                              prefixIcon: Icon(Icons.male),
                              border:OutlineInputBorder(),
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isEmpty ? "Please Enter Gender" : null;
                            },
                          ),
                        ),

                              ],
                            ),

                        const SizedBox(height:30),

                        TextFormField(
                          controller: DOBController,
                          decoration: const InputDecoration(
                              labelText: "DOB",
                              hintText: "Enter Date of Birth",
                              prefixIcon: Icon(Icons.cake),
                              border:OutlineInputBorder()
                          ),

                          onChanged: (String value){

                          },
                          validator: (value){
                            return value!.isEmpty ? "Please Enter DOB" : null;
                          },
                        ),

                        const SizedBox(height:30),

                        TextFormField(
                          controller: timeController,
                          decoration: const InputDecoration(
                              labelText: "Timing",
                              hintText: "Enter date of appointment (DD/MM/YYYY - HH:MM:SS)",
                              prefixIcon: Icon(Icons.lock_clock),
                              border:OutlineInputBorder()
                          ),

                          onChanged: (String value){

                          },
                          validator: (value){
                            return value!.isEmpty ? "Please Enter correct date" : null;
                          },
                        ),


                        const SizedBox(height:10),

                        MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () async {
                              final response = await sendEmail(
                                  DrNameController.value.text,
                                  nameController.value.text,
                                  emailController.value.text,
                                  ageController.value.text,
                                  genderController.value.text,
                                  DOBController.value.text,
                                  timeController.value.text
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                response == 200
                                    ? const SnackBar(
                                    content: Text('Email Sent!'),
                                    backgroundColor: Colors.green)
                                    : const SnackBar(
                                    content: Text('Failed to send Email!'),
                                    backgroundColor: Colors.red),
                              );

                            nameController.clear();
                            emailController.clear();
                            ageController.clear();
                            genderController.clear();
                            DOBController.clear();
                            timeController.clear();
                            DrNameController.clear();
                          },

                          color:Colors.teal,
                          textColor: Colors.white,
                          child: const Text("Submit"),

                        )

                      ]
                  )
              ),
            )

          ],
        )

    );
  }
}
