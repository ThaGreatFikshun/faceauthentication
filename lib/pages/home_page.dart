import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
      floatingActionButton: _authButton(),
    );
  }

  Widget _authButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _isAuthenticated = !_isAuthenticated;
        });
      },
      child: Icon(
        _isAuthenticated ? Icons.lock : Icons.lock_open,
      ),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Ledger Balance",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (_isAuthenticated)
            const Text(
              "\KES 99M",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (!_isAuthenticated)
            const Text(
              "********",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
        ],
      ),
    );
  }
}
