class ModelUser {
   final int id;
   final String first;
   final String last;
   final String email;
   final String picture;

   const ModelUser({this.id, this.first, this.last, this.email, this.picture});
 }

 List<ModelUser> users = [
   const ModelUser(
     id: 1,
     first: "Bradly",
     last: "Grevink",
     email: "bradly.grevink@example.com",
     picture: "https://randomuser.me/api/portraits/thumb/men/3.jpg",
   ),
   const ModelUser(
     id: 2,
     first: "Jesus",
     last: "Soto",
     email: "jesus.soto@example.com",
     picture: "https://randomuser.me/api/portraits/thumb/men/51.jpg",
   ),
   const ModelUser(
     id: 3,
     first: "Heidi",
     last: "Harper",
     email: "heidi.harper@example.com",
     picture: "https://randomuser.me/api/portraits/thumb/women/45.jpg",
   ),
 ];

