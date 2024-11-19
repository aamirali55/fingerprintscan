import 'package:fingerprintscan/ui/views/splash/splash_view_model.dart';
import 'package:fingerprintscan/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.delay(),
      builder: (context, model, child) => const Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Authenticator",
                style: TextStyle(
                    color: AppColor.secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.fingerprint,
                color: AppColor.buttonColor,
                size: 60,
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                color: AppColor.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
