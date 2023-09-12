import 'package:flutter/material.dart';

import '../utils/colors.dart';


bool isLoadingShown = false;
void showLoading(BuildContext context) {
  isLoadingShown = true;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(0),
        child: WillPopScope(
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            onWillPop: () async {
              return false;
            }),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  if(isLoadingShown) {
    Navigator.of(context).pop();
    isLoadingShown = false;
  }
}
