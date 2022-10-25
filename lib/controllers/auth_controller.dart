import 'package:appkwiz/controllers/firebase_ref/references.dart';
import 'package:appkwiz/screens/login/login_screen.dart';
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
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      print(error);
    }
  } // C:\Users\hp
  //keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

  // ignore: slash_for_doc_comments
  /**
   * SHA1: BB:A9:86:51:66:BE:7B:51:1E:40:4D:AE:35:20:3D:9C:CD:03:16:6E
         SHA256: 72:DE:8C:AB:97:65:00:75:B7:54:F1:89:5D:68:55:7C:84:1F:D2:B7:53:81:CD:FE:46:8F:15:2C:24:31:F5:33
Signature algorithm name: SHA1withRSA (weak)
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1

Warning:
The certificate uses the SHA1withRSA signature algorithm which is considered a security risk. This algorithm will be disabled in a future update.
   */

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "displayName": account.displayName,
      "photoUrl": account.photoUrl,
      // "id": account.id,
    });
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(onTap: () {
        Get.back();
        // Navigate to Login Page
        navigateToLoginPage();
      }),
      barrierDismissible: false,
    );
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
}
