class UserModel
{
  String? name;
  String? phone;
  String? email;
  String? image;
  String? cover;
  String? bio;
  String? uid;

  UserModel({
    this.uid,
    this.email,
    this.image,
    this.name,
    this.cover,
    this.bio,
    this.phone
});


  UserModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];
    bio = json['bio'];
    cover = json['cover'];
    image = json['image'];
    email = json['email'];
  }


  Map<String,dynamic> toMap()
  {
    return
      {
        'name' : name,
        'email' : email,
        'uid' : uid,
        'cover' : cover,
        'image' : image,
        'bio' : bio,
        'phone' : phone,
      };
  }



}