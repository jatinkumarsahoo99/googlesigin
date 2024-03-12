import 'package:flutter/material.dart';
import 'package:google_login/app/commonWidgets/tap_effect.dart';

import '../AppTheme/text_styles.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor;
  final bool? isClickable;
  final bool? isEnable;
  final double radius;
  const CommonButton({
    Key? key,
    this.onTap,
    this.buttonText,
    this.buttonTextWidget,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.padding,
    this.isClickable = true,
    this.isEnable = true,
    this.radius = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: TapEffect(
        isClickable:(isEnable == true)? isClickable!:false,
        onClick: onTap ?? () {},
        child: SizedBox(
          height: 48,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color:(isEnable == true)? (backgroundColor ?? Theme.of(context).primaryColor):Colors.grey,
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: Center(
              child: buttonTextWidget ??
                  Text(
                    buttonText ?? "",
                    style: TextStyles(context).getRegularStyle().copyWith(
                          color: textColor,
                          fontSize: 16,
                        ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
