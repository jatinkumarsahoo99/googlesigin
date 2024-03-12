import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AppTheme/text_styles.dart';
import '../AppTheme/themes.dart';

class CommTextFieldPassword extends StatefulWidget {
  final String? titleText;
  final int? maxLength;
  final String hintText;
  final String? errorText;
  final bool isAllowTopTitleView;
  final bool? enable;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double? pad;
  final double? height;
  final BuildContext? contextNew;

  CommTextFieldPassword({
    Key? key,
    this.hintText = '',
    this.padding = const EdgeInsets.only(bottom: 0, right: 0, top: 0, left: 0),
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.isAllowTopTitleView = true,
    this.errorText,
    this.titleText = '',
    this.controller,
    this.maxLength,
    this.pad = 16,
    this.contextNew,
    this.height,
    this.enable = true,
  }) : super(key: key);

  @override
  _CommTextFieldPasswordState createState() => _CommTextFieldPasswordState();
}

class _CommTextFieldPasswordState extends State<CommTextFieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isAllowTopTitleView && widget.titleText != '')
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                widget.titleText ?? "",
                style: TextStyles(context).getDescriptionStyle().copyWith(fontSize: 11),
              ),
            ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            shadowColor: Colors.grey.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.6,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: widget.pad!, right: widget.pad!),
              child: SizedBox(
                height: widget.height ?? 48,
                child: Center(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        controller: widget.controller,
                        maxLines: 1,
                        enabled: widget.enable,
                        onChanged: widget.onChanged,
                        maxLength: widget.maxLength ?? 50,
                        style: TextStyles(context).getRegularStyle().copyWith(
                          color: ((widget.enable == false)
                              ? (Theme.of(context).disabledColor)
                              : AppTheme.primaryTextColor),
                        ),
                        obscureText: _obscureText,
                        cursorColor: Theme.of(context).primaryColor,
                        onEditingComplete: () {
                          if (context != null) {
                            FocusScope.of(context)?.nextFocus();
                          } else if (Get.context != null) {
                            FocusScope.of(Get.context!).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          errorText: null,
                          counterText: "",
                          border: InputBorder.none,
                          hintText: widget.hintText,
                          hintStyle: TextStyle(
                            color: Theme.of(context).disabledColor,
                            fontSize: 12,
                          ),
                        ),
                        keyboardType: widget.keyboardType,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (widget.errorText != null && widget.errorText != '')
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
              child: Text(
                widget.errorText ?? "",
                style: TextStyles(context).getDescriptionStyle().copyWith(
                  color: AppTheme.redErrorColor,
                  fontSize: 12,
                ),
              ),
            )
        ],
      ),
    );
  }
}
