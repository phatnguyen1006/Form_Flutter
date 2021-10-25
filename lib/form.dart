import 'package:flutter/material.dart';
import 'IForm.dart';
import 'json/province.dart';
import 'Components/custom_dropdown.dart';

class FormInfomation extends StatefulWidget {
  const FormInfomation({Key? key}) : super(key: key);

  @override
  _FormInfomationState createState() => _FormInfomationState();
}

class _FormInfomationState extends State<FormInfomation> {
  var _formData = IForm(
    username: '',
    email: '',
    gender: '',
    phone: '',
    address: '',
    city: '',
    district: '',
    country: '',
    addressName: "",
    postcode: "",
    province: "",
    ward: "",
  );
  final _nameField = FocusNode();
  final _emailField = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _submitButtonFocus = FocusNode();
  // final _emailFocus = FocusNode();
  final _genderFocus = FocusNode();
  final _phoneFocus = FocusNode();

  final _addressFocus = FocusNode();
  final _cityFocus = FocusNode();
  final _districtFocus = FocusNode();
  final _wardFocus = FocusNode();

  // radio
  bool _value = false;
  int val = -1;

  // var
  List<bool> checkboxArr = [false, false, false];
  List<String> data = [];
  List<String> districtsData = [];
  late String dropdownValue;
  late String province;
  late String district;

  int chooseGender = 2;

  @override
  void initState() {
    // TODO: implement initState
    data = genListProvinces();
    dropdownValue = data[0];

    province = "Hồ Chí Minh";
    //print(widget.userData["district"]);
    districtsData = genListDistricts(province);
    district = districtsData[0];
    //print(district);
    // gender.indexOf((widget.userData["gender"] != null
    //             ? widget.userData["gender"].toString()
    //             : "")) >=
    //         0
    //     ? chooseGender = gender.indexOf((widget.userData["gender"] != null
    //         ? widget.userData["gender"].toString()
    //         : ""))
    //     : chooseGender = 2;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameField.dispose();
    _emailField.dispose();
    _submitButtonFocus.dispose();
    // _emailFocus.dispose();
    _genderFocus.dispose();
    _phoneFocus.dispose();

    _addressFocus.dispose();
    _cityFocus.dispose();
    _districtFocus.dispose();
    _wardFocus.dispose();
    super.dispose();
  }

  void _setDistrict(String province) {
    setState(() {
      districtsData = genListDistricts(province);
      district = districtsData[0];
    });
  }

  Widget spacer() {
    return SizedBox(
      height: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Form(
        child: ListView(
          children: [
            TextFormField(
              focusNode: _nameField,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Full Name",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey),
                ),
              ),
              cursorColor: Colors.black,
              maxLines: 1,
              validator: (value) {
                if (value!.isEmpty) return 'Please fill KhoiNg name.';
                return null; // Correct input
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailField);
              },
              onSaved: (value) {
                _formData = IForm(
                  username: value ?? "Khoi Ng",
                  email: _formData.email,
                );
              },
            ),
            spacer(),
            TextFormField(
              focusNode: _emailField,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey),
                ),
              ),
              cursorColor: Colors.black,
              maxLines: 1,
              validator: (value) {
                if (value!.isEmpty)
                  return "Please fill your email";
                else if (!value.contains("\@"))
                  return "Please fill correct email";
                return null; // Correct input
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus();
              },
              onSaved: (value) {
                _formData = IForm(
                  username: _formData.username,
                  email: value ?? "",
                );
              },
            ),
            spacer(),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Which kinds of phone are you using?",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 20,
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: this.checkboxArr[0],
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          this.checkboxArr[0] = !this.checkboxArr[0];
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: const Text('Android'),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 20,
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: this.checkboxArr[1],
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          this.checkboxArr[1] = !this.checkboxArr[1];
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: const Text('iOS'),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 20,
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: this.checkboxArr[2],
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          this.checkboxArr[2] = !this.checkboxArr[2];
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: const Text('Window Phone'),
                  ),
                ],
              ),
            ),
            spacer(),
            CustomDropdown(
              focus: _cityFocus,
              dropdownMenuItemList: data,
              onChanged: (String? newValue) {
                setState(() {
                  province = newValue!;
                  _setDistrict(newValue);
                  _formData = IForm(
                    email: _formData.email,
                    username: _formData.username,
                    gender: _formData.gender,
                    phone: _formData.phone,
                    address: _formData.address,
                    city: newValue,
                    district: _formData.district,
                    country: 'Việt Nam',
                    addressName: "",
                    postcode: "",
                    province: newValue,
                    ward: _formData.ward,
                  );
                  FocusScope.of(context).requestFocus(_submitButtonFocus);
                });
              },
              value: province,
              isEnabled: true,
            ),
            spacer(),
            CustomDropdown(
              focus: _districtFocus,
              dropdownMenuItemList: districtsData,
              onChanged: (String? newValue) {
                setState(() {
                  district = newValue!;
                  _formData = IForm(
                    email: _formData.email,
                    username: _formData.username,
                    gender: _formData.gender,
                    phone: _formData.phone,
                    address: _formData.address,
                    city: _formData.city,
                    district: newValue,
                    country: 'Việt Nam',
                    addressName: "",
                    postcode: "",
                    province: _formData.province,
                    ward: _formData.ward,
                  );
                  FocusScope.of(context).requestFocus(_cityFocus);
                });
              },
              value: district,
              isEnabled: true,
            ),
            spacer(),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Gender:",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.red),
                  child: ListTile(
                    title: Text("Male"),
                    leading: Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (int? value) {
                        setState(() {
                          val = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ),
                ),
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.red),
                  child: ListTile(
                    title: Text("Female"),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (int? value) {
                        setState(() {
                          val = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
