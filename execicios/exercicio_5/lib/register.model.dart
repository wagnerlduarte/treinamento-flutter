class RegisterModel {
  String fullName;
  String email;
  String phoneNumber;
  String country;
  String password;
  String confirmPassword;
  String referralCode;

  RegisterModel(
      {this.fullName,
      this.email,
      this.phoneNumber,
      this.country,
      this.password,
      this.confirmPassword,
      this.referralCode});
}
