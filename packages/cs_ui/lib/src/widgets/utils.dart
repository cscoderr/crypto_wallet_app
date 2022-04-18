import 'dart:io';

import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showErrorMessage(BuildContext context, {String? error}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: CsColors.white),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                error!,
                style: CsTextStyle.smallText.copyWith(
                  fontSize: 16,
                  color: CsColors.white,
                ),
              ),
            )
          ],
        ),
        dismissDirection: DismissDirection.startToEnd,
        margin: const EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static void showSuccessMessage(BuildContext context,
      {String? message}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF20BD2C),
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: CsColors.white,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              message!,
              style: CsTextStyle.smallText.copyWith(
                fontSize: 16,
                color: CsColors.white,
              ),
            )
          ],
        ),
        dismissDirection: DismissDirection.startToEnd,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  static Future<void> showLoadingDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      // for testing, for now this will be true, should be changed to false later
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          // for testing, for now this will be true, should be changed to false later
          onWillPop: () async => true,
          child: SimpleDialog(
            //key: key ?? const Key('0'),
            elevation: 0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              if (Platform.isIOS)
                Center(
                  child: Theme(
                    data: ThemeData(
                      cupertinoOverrideTheme:
                          const CupertinoThemeData(brightness: Brightness.dark),
                    ),
                    child: const CupertinoActivityIndicator(
                      radius: 18,
                    ),
                  ),
                )
              else
                const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: CsColors.primary,
                    strokeWidth: 1.3,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
