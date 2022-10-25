import 'package:appkwiz/controllers/firebase_ref/references.dart';
import 'package:appkwiz/widgets/dialogs/dialogue_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
    //onReady() which is called after the widget is rendered on the screen
  }

  late FirebaseAuth _auth;

  final Rxn<User> _user = Rxn<User>();
  // We want to create user stream
  late Stream<User?> _authStateChanges;

  Future<void> initAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen(
      (User? user) {
        _user.value = user;
      },
    );
    navigateToIntroduction();
  }

  SignInWithGoogle() async {
    final GoogleSignIn _googlesignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googlesignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication _authAccount =
            await account.authentication;
        final OAuthCredential _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.accessToken,
          accessToken: _authAccount.accessToken,
        );
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "displayName": account.displayName,
      "photoUrl": account.photoUrl,
      "id": account.id,
    });
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(onTap: () {
        Get.back();
        // Navigate to Login Page
      }),
      barrierDismissible: false,
    );
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
}
