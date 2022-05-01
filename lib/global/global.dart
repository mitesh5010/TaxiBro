import 'package:firebase_auth/firebase_auth.dart';
// import 'package:users_app/models/user_model.dart';

import '../models/user.dart';



final FirebaseAuth fAuth = FirebaseAuth.instance;
User currentFirebaseUser;
UserModel userModelCurrentInfo;