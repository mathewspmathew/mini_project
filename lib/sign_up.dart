import 'package:flutter/material.dart';
import 'package:mini4/profile.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 200,
        title: const Text(
          "My part time job finder",
          style: TextStyle(color: Color.fromRGBO(86, 86, 86, 100)),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration( 
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(180),
                  bottomRight: Radius.circular(180)),
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(114, 230, 255, 100).withOpacity(1),
              const Color.fromRGBO(6, 210, 255, 100).withOpacity(1),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 250),
            Center(
                child: Image.asset(
              'assets/FindMyPage.png',
              height: 240,
              width: 220,
            )),
            const SizedBox(
              height: 100,
            ),
            TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(100, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStatePropertyAll(
                        const Color.fromRGBO(6, 209, 255, 0.801)
                            .withOpacity(1))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
