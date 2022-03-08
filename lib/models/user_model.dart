class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  // Map<String, String>? company;
  // Map<String, String>? address;
  UserModel(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.phone,
        this.website,
        // this.company,
        // this.address,
      });
}