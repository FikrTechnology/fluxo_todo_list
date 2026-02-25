import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluxo_todo_list/core/constants/app_colors.dart';
import 'package:fluxo_todo_list/core/constants/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  void _navigateToHome() {
    Future.delayed(Duration(seconds: 3), (
      () => context.replace('/home')
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -150, // Sesuaikan posisi vertikal agar terlihat natural
            right: 50,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                // Menggunakan kode warna 135BEC dengan opacity 0.1
                color: const Color(0xFF135BEC).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              // Menerapkan blur langsung pada container warna tersebut
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            bottom: -150, // Sesuaikan posisi vertikal agar terlihat natural
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                // Menggunakan kode warna 135BEC dengan opacity 0.1
                color: const Color(0xFF135BEC).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              // Menerapkan blur langsung pada container warna tersebut
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/logoFluxo.svg',
                  width: 128,
                ),
                Text(
                  'Fluxo',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.white,
                    height: 1
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  'STREAMLINE YOUR DAY',
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.lightGray,
                    height: 1,
                    letterSpacing: 1.4
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}