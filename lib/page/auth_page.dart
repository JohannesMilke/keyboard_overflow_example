import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue.shade600,
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                buildLogo(),
                SizedBox(height: 32),
                buildUsernameField(),
                SizedBox(height: 16),
                buildPasswordField(),
                SizedBox(height: 32),
                buildLoginButton(context),
              ],
            ),
          ),
        ),
      );

  /// FIRST resizeToAvoidBottomInset
  /// => Not scrollable => Not really great solution!
  /*
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade600,
        body: Center(
            child:  Padding(
          padding: EdgeInsets.all(32),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildLogo(),
                const SizedBox(height: 32),
                buildUsernameField(),
                SizedBox(height: 16),
                buildPasswordField(),
                SizedBox(height: 32),
                buildLoginButton(context),
              ],
            ),
          ),
        ),
      );
   */

  /// FIRST BONUS React on Keyboard
  /// => NOT scrollable
  /// => No Logo Displayed
  /*
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (!isKeyboard) buildLogo(),
              const SizedBox(height: 32),
              buildUsernameField(),
              SizedBox(height: 16),
              buildPasswordField(),
              SizedBox(height: 32),
              buildLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }
  */

  /// SECOND SingleChildScrollView
  /// => Scrollable
  /// => Is NOT scrolling to the end - login button is NOT displayed
  /*
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue.shade600,
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            buildLogo(),
            SizedBox(height: 32),
            buildUsernameField(),
            SizedBox(height: 16),
            buildPasswordField(),
            SizedBox(height: 32),
            buildLoginButton(context),
          ],
        ),
      ),
    ),
  );
  */

  /// SECOND BONUS SingleChildScrollView
  /// => Scrollable
  /// => Is scrolling to the end - login button is displayed
  /* @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue.shade600,
    body: Center(
      child: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            buildLogo(),
            SizedBox(height: 32),
            buildUsernameField(),
            SizedBox(height: 16),
            buildPasswordField(),
            SizedBox(height: 32),
            buildLoginButton(context),
          ],
        ),
      ),
    ),
  );
  */

  /// THIRD ListView
  /// => Scrollable
  /// => Is NOT scrolling to the end - login button is NOT displayed
  /* @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue.shade600,
    body: Center(
      child: ListView(
        padding: EdgeInsets.all(32),
        shrinkWrap: true,
        children: <Widget>[
          buildLogo(),
          SizedBox(height: 32),
          buildUsernameField(),
          SizedBox(height: 16),
          buildPasswordField(),
          SizedBox(height: 32),
          buildLoginButton(context),
        ],
      ),
    ),
  );
  */

  /// THIRD BONUS ListView
  /// => Scrollable
  /// => Is scrolling to the end - login button is displayed
  /*
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue.shade600,
    body: Center(
      child: ListView(
        padding: EdgeInsets.all(32),
        shrinkWrap: true,
        reverse: true,
        children: <Widget>[
          buildLogo(),
          SizedBox(height: 32),
          buildUsernameField(),
          SizedBox(height: 16),
          buildPasswordField(),
          SizedBox(height: 32),
          buildLoginButton(context),
        ].reversed.toList(),
      ),
    ),
  );
  */

  Widget buildLogo() {
    final urlLogo =
        'https://images.unsplash.com/photo-1601158935942-52255782d322?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=376&q=80';

    return CircleAvatar(
      backgroundColor: Colors.white38,
      backgroundImage: NetworkImage(urlLogo),
      radius: 140,
    );
  }

  Widget buildUsernameField() => TextFormField(
        autocorrect: true,
        textCapitalization: TextCapitalization.words,
        enableSuggestions: false,
        validator: (value) {},
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Username',
          hintStyle: TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white38,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onSaved: (username) {},
      );

  Widget buildPasswordField() => TextFormField(
        validator: (value) {},
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white38,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        obscureText: true,
        onSaved: (password) {},
      );

  Widget buildLoginButton(BuildContext context) => ElevatedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          minimumSize: Size.fromHeight(50),
          backgroundColor: Colors.white,
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {},
      );
}
