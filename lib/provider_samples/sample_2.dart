import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class AuthProvider extends ChangeNotifier {
  String? _loggedInUser;

  String get loggedInUser => _loggedInUser!;

  bool get isLoggedIn => _loggedInUser != null;

  void login(String username, String password) {
    // In a real app, you'd perform authentication here.
    // For simplicity, we'll just check for a hardcoded username and password.
    if (username == 'user' && password == 'password') {
      _loggedInUser = username;
      notifyListeners();
    }
  }

  void logout() {
    _loggedInUser = null;
    notifyListeners();
  }

  void register(String username, String password) {
    // In a real app, you'd perform user registration here.
    // For simplicity, we'll just print the username and password.
    print('Registered: $username, $password');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        home: AuthScreen(),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login and Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (authProvider.isLoggedIn)
              Column(
                children: [
                  Text('Welcome, ${authProvider.loggedInUser}!'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      authProvider.logout();
                    },
                    child: Text('Logout'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text('Go to Home'),
                  ),
                ],
              )
            else
              Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      authProvider.login(
                        usernameController.text,
                        passwordController.text,
                      );
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      authProvider.register(
                        usernameController.text,
                        passwordController.text,
                      );
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${authProvider.loggedInUser}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authProvider.logout();
                Navigator.pop(context); // Navigate back to the login screen
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
