import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44, bottom: 32),
              child: Container(
                height: 46,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset('assets/images/icon_apple_blue.png'),
                    const Expanded(
                      child: Text(
                        "User Account",
                        style: TextStyle(
                            color: ConstColor.blue,
                            fontFamily: 'RB',
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Arsham Rezakhani',
              style: TextStyle(fontFamily: 'RB', fontSize: 16),
            ),
            const Text(
              '09374214330',
              style: TextStyle(fontSize: 10, fontFamily: 'RM'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Wrap(
              spacing: 50,
              runSpacing: 30,
              children: [
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
                // CategoryHorizontalItemList(),
              ],
            ),
            const Spacer(),
            const Text(
              'Apple Shop',
              style: TextStyle(
                  fontSize: 10, fontFamily: 'RM', color: ConstColor.grey),
            ),
            const Text(
              'v-1.0.00',
              style: TextStyle(
                  fontSize: 10, fontFamily: 'RM', color: ConstColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}
