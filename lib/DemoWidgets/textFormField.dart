// import 'package:flutter/material.dart';
// import 'package:formdemo/Models/IForm.dart';


// class TextFormFieldDemo extends StatelessWidget {
//   late final _formData;
//   final _nameField;
//   final _emailField;
//   TextFormFieldDemo({Key? key, required this._formData, required this._nameField}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//               focusNode: _nameField,
//               keyboardType: TextInputType.name,
//               decoration: InputDecoration(
//                 labelText: "Full Name",
//                 labelStyle: TextStyle(color: Colors.black, fontSize: 20),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: Colors.black),
//                 ),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: Colors.grey),
//                 ),
//               ),
//               cursorColor: Colors.black,
//               maxLines: 1,
//               validator: (value) {
//                 if (value!.isEmpty) return 'Please fill KhoiNg name.';
//                 return null; // Correct input
//               },
//               onFieldSubmitted: (_) {
//                 FocusScope.of(context).requestFocus(_emailField);
//               },
//               onSaved: (value) {
//                 _formData = IForm(
//                   username: value ?? "Khoi Ng",
//                   email: _formData.email,
//                 );
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               focusNode: _emailField,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 labelText: "Email",
//                 labelStyle: TextStyle(color: Colors.black, fontSize: 20),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: Colors.black),
//                 ),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: Colors.grey),
//                 ),
//               ),
//               cursorColor: Colors.black,
//               maxLines: 1,
//               validator: (value) {
//                 if (value!.isEmpty)
//                   return "Please fill your email";
//                 else if (!value.contains("\@"))
//                   return "Please fill correct email";
//                 return null; // Correct input
//               },
//               onFieldSubmitted: (_) {
//                 FocusScope.of(context).requestFocus();
//               },
//               onSaved: (value) {
//                 _formData = IForm(
//                   username: _formData.username,
//                   email: value ?? "",
//                 );
//               },
//             );
//   }
// }
