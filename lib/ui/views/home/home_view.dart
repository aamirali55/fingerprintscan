import 'package:fingerprintscan/ui/views/home/home_viewmodel.dart';
import 'package:fingerprintscan/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColor.secondaryColor,
            title: const Center(
              child: const Text(
                'Authenticator',
                style: TextStyle(
                    color: AppColor.buttonColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Center(
            child: model.isBusy
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.authMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColor.buttonColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                AppColor.secondaryColor)),
                        onPressed: model.authenticate,
                        child: const Text(
                          'Scan Fingerprint',
                          style: TextStyle(color: AppColor.buttonColor),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
