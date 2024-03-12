import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commonWidgets/custom_dialog.dart';

mixin Helper {

  Future<bool> showCommonPopup(
      String title, String descriptionText, BuildContext context,
      {bool isYesOrNoPopup = false, bool barrierDismissible = true}) async {
    bool isOkClick = false;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: descriptionText,
        onCloseClick: () {
          Navigator.of(context).pop();
        },
        actionButtonList: isYesOrNoPopup
            ? <Widget>[
                CustomDialogActionButton(
                  buttonText: "NO",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CustomDialogActionButton(
                  buttonText: "YES",
                  color: Colors.red,
                  onPressed: () {
                    isOkClick = true;
                    Navigator.of(context).pop();
                  },
                )
              ]
            : <Widget>[
                CustomDialogActionButton(
                  buttonText: "OK",
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
      ),
    ).then((_) {
      return isOkClick;
    });
  }

  Future<bool> showCommonPopupNew(
      String title, String descriptionText, BuildContext context,
      {bool isYesOrNoPopup = false, bool barrierDismissible = true}) async {
    bool isOkClick = false;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: descriptionText,
        onCloseClick: () {
          Navigator.of(context).pop();
        },
        actionButtonList: isYesOrNoPopup
            ? <Widget>[
          CustomDialogActionButton(
            buttonText: "NO",
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CustomDialogActionButton(
            buttonText: "YES",
            color: Colors.red,
            onPressed: () {
              isOkClick = true;
              Navigator.of(context).pop();
            },
          )
        ]
            : <Widget>[
          CustomDialogActionButton(
            buttonText: "OK",
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    ).then((_) {
      return isOkClick;
    });
  }


}
