import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'Models/IForm.dart';
import 'json/province.dart';
import 'Components/custom_dropdown.dart';

class FormInfomation extends StatefulWidget {
  const FormInfomation({Key? key}) : super(key: key);

  @override
  _FormInfomationState createState() => _FormInfomationState();
}

class _FormInfomationState extends State<FormInfomation> {
  var _formData = IForm(
    dob: DateTime.now(),
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

  final _formKey = GlobalKey<FormState>();
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
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
  DateTime date = DateTime.now();

  // var
  List<bool> checkboxArr = [false, false, false];
  List<String> data = [];
  List<String> districtsData = [];
  late String dropdownValue;
  late String province;
  late String district;

  int chooseGender = 2;

  int i = 0;
  Color bg = Colors.white;

  void changeBackground() {
    List<Color> bgColor = [
      Colors.cyanAccent,
      Colors.red,
      Colors.white,
      Colors.blue,
      Colors.grey
    ];

    setState(() {
      bg = bgColor[i++];
    });

    if (i >= 3) {
      i = 0;
    }
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  void _showMaterialDialog(result) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Submit Successfully!!!'),
            content: Text(result),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('OK')),
              // Text("${_formData.toString()}"),
            ],
          );
        });
  }

  void _submitForm() {
    bool validForm = _formKey.currentState!.validate();
    if (!validForm) {
      return;
    } else {
      _formKey.currentState!.save();
      String _result =
          "${_formData.username.toString()}\n${_formData.email.toString()}\n${_formData.phone.toString()}\n${_formData.dob.toString()}";
      _showMaterialDialog(_result);
    }
  }

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
    _nameFocus.dispose();
    _emailFocus.dispose();
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
      height: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            // textField

            spacer(),
            // checkBox
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
            // dropdownButton
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Where do you live?",
                style: TextStyle(fontSize: 16),
              ),
            ),
            CustomDropdown(
              focus: _cityFocus,
              dropdownMenuItemList: data,
              onChanged: (String? newValue) {
                setState(() {
                  province = newValue!;
                  _setDistrict(newValue);
                  _formData = IForm(
                    dob: date,
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
                    dob: date,
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
            ),
            spacer(),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                focusNode: _nameFocus,
                keyboardType: TextInputType.name,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  hintText: "Ex: Nguyen Ngoc Khoi",
                  icon: Icon(Icons.person),
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
                    return 'Please fill Nguyễn Ngọc Khôi name.';
                  return null; // Correct input
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                onSaved: (value) {
                  _formData = IForm(
                    dob: date,
                    username: value ?? "Khoi Ng",
                    email: _formData.email,
                  );
                },
              ),
            ),
            spacer(),
            TextFormField(
              focusNode: _emailFocus,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Ex: NguyenNgocKhoi@gmail.com",
                icon: Icon(Icons.email_outlined),
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
                  dob: date,
                  username: _formData.username,
                  email: value ?? "",
                );
              },
            ),
            spacer(),
            TextFormField(
              focusNode: _phoneFocus,
              keyboardType: TextInputType.phone,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Phone",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey),
                ),
              ),
              cursorColor: Colors.black,
              // InputFormantters
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny("84"),
                // FilteringTextInputFormatter.allow("84"),
              ],
              maxLines: 1,
              validator: (value) {
                if (value!.isEmpty) return "Please fill your phone number";
                return null; // Correct input
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus();
              },
              onSaved: (value) {
                _formData = IForm(
                  dob: date,
                  username: _formData.username,
                  phone: value ?? "",
                  email: _formData.email,
                );
              },
              // Input Controller
              onChanged: (value) {
                changeBackground();
              },
            ),
            spacer(),
            DateTimeField(
              format: DateFormat("dd-MM-yyyy"),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
              decoration: InputDecoration(
                labelText: "Date of Birth",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey),
                ),
              ),
              onSaved: (newDate) {
                _formData = IForm(
                  dob: newDate!,
                  email: _formData.email,
                  username: _formData.username,
                  gender: _formData.gender,
                  phone: _formData.phone,
                  address: _formData.address,
                  city: _formData.city,
                  district: _formData.district,
                  country: 'Việt Nam',
                  addressName: "",
                  postcode: "",
                  province: _formData.province,
                  ward: _formData.ward,
                );
              },
            ),
            spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _submitForm();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => RegisterAuthScreen()));
                },
                focusNode: _submitButtonFocus,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  elevation: MaterialStateProperty.all<double>(12.0),
                ),
                child: Text("SUBMIT",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 13 * 1.55,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
