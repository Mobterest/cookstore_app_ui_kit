import 'package:flutter/material.dart';
import '../globals/config.dart';
import '../globals/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import 'recipes.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  State<StatefulWidget> createState() => SigninState();
}

class SigninState extends State<Signin> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String _message = 'Log in/out by pressing the buttons below.';
  List cartItems = [];
  Widget build(context) {
    return Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(BG_IMAGE), fit: BoxFit.cover)),
          constraints: BoxConstraints.expand()),
      Positioned(
          top: DIM_POSITION_TOP_1,
          child: Padding(
              padding: DIM_LOGIN_PADDING_1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      LOGIN_TITLE,
                      style: STYLE_LOGIN_TITLE,
                    ),
                    Padding(
                        padding: DIM_LOGIN_PADDING_2,
                        child:
                            Text(LOGIN_SUBTITLE, style: STYLE_LOGIN_SUBTITLE)),
                    Padding(
                        padding: DIM_LOGIN_PADDING_3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                DIM_SIZEDBOX_WIDTH,
                            height: DIM_SIZEDBOX_HEIGHT,
                            child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: LOGIN_E_USERNAME,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: DBLUE_PALETTE,
                                  ),
                                  hintStyle: STYLE_LOGIN_TFIELD,
                                  filled: true,
                                  fillColor: WHITE_PALETTE,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                )))),
                    Padding(
                        padding: DIM_LOGIN_PADDING_3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                DIM_SIZEDBOX_WIDTH,
                            height: DIM_SIZEDBOX_HEIGHT,
                            child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: LOGIN_E_PASS,
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: DBLUE_PALETTE,
                                  ),
                                  hintStyle: STYLE_LOGIN_TFIELD,
                                  filled: true,
                                  fillColor: WHITE_PALETTE,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                )))),
                    Padding(
                        padding: DIM_LOGIN_PADDING_4,
                        child: Container(
                            width: MediaQuery.of(context).size.width *
                                DIM_SIZEDBOX_WIDTH,
                            height: DIM_SIZEDBOX_HEIGHT,
                            child: RaisedButton(
                                color: WHITE_PALETTE,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Recipes(cartItems)));
                                },
                                shape: StadiumBorder(),
                                child: Text(LOGIN_BTN_TEXT,
                                    style: STYLE_LOGIN_BTN)))),
                    Padding(
                        padding: DIM_LOGIN_PADDING_5,
                        child: Text(
                          LOGIN_SM_TITLE,
                          style: STYLE_LOGIN_SM_TITLE,
                        )),
                    Padding(
                        padding: DIM_LOGIN_PADDING_6,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  height: DIM_SIZEDBOX_HEIGHT,
                                  child: RaisedButton.icon(
                                    shape: StadiumBorder(),
                                    color: WHITE_PALETTE,
                                    icon: Padding(
                                        padding: DIM_LOGIN_PADDING_7,
                                        child: FaIcon(
                                            FontAwesomeIcons.facebookF,
                                            color: BLUE_PALETTE,
                                            size: FAICON_SIZE)),
                                    onPressed: () {
                                      _login();
                                    },
                                    label: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                DIM_BTN_CONTAINER_WIDTH,
                                        child: Text(FB)),
                                  )),
                              SizedBox(width: DIM_SIZEDBOX_HEIGHT_1),
                              Container(
                                  height: DIM_SIZEDBOX_HEIGHT,
                                  child: RaisedButton.icon(
                                    shape: StadiumBorder(),
                                    color: WHITE_PALETTE,
                                    icon: Padding(
                                        padding: DIM_LOGIN_PADDING_7,
                                        child: FaIcon(FontAwesomeIcons.google,
                                            color: BLUE_PALETTE,
                                            size: FAICON_SIZE)),
                                    onPressed: () {
                                      signInWithGoogle().whenComplete(() {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Recipes(cartItems);
                                            },
                                          ),
                                        );
                                      });
                                    },
                                    label: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                DIM_BTN_CONTAINER_WIDTH,
                                        child: Text(Gg)),
                                  ))
                            ]))
                  ])))
    ]);
  }

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<String> signInWithGoogle() async {
    //UNCOMMENT BELOW AFTER YOUR FIREBASE SETUP

    // final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    // final GoogleSignInAuthentication googleSignInAuthentication =
    //     await googleSignInAccount.authentication;

    // final AuthCredential credential = GoogleAuthProvider.getCredential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );

    // final AuthResult authResult = await _auth.signInWithCredential(credential);
    // final FirebaseUser user = authResult.user;

    // assert(!user.isAnonymous);
    // assert(await user.getIdToken() != null);

    // final FirebaseUser currentUser = await _auth.currentUser();
    // assert(user.uid == currentUser.uid);

    // return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}
