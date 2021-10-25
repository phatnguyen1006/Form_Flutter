class IForm {
  final String username;
  final String email;
  final String gender;
  final String phone;
  final String address;
  final String city;
  final String district;

  final String country;
  final String addressName;
  final String postcode;
  final String province;
  final String ward;

  IForm({
    required this.username,
    required this.email,
    this.gender = "",
    this.phone = "",
    this.address = "",
    this.city = "",
    this.district = "",
    this.province = "",
    this.country = "VietNam",
    this.addressName = "",
    this.postcode = "",
    this.ward = "",
  });
}
