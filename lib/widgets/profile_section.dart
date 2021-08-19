import 'package:flutter/material.dart';
import 'search_bar.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .3,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD369),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                "Welcome,\nAdd all your\nfavourite movies",
                style: TextStyle(
                    fontFamily: "Raleway", fontSize: 35, color: Colors.black),
              ),
              //SearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}
