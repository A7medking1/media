import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void navigateTO(context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

void navigatorAndFinish(
  context,
  Widget page,
) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) => false,
  );
}

validate(String value) {
  if (value.isEmpty) return 'Form Must Not Be Empty';
  // if(value.length < 9) return 'Must be More than 9 character';
  return null;
}


Widget myDivider() => Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey,
      ),
    );


class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton(
      {Key? key,
      required this.title,
      required this.pressed,
      required this.fontSize,
      this.color})
      : super(key: key);

  final String? title;
  final void Function() pressed;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pressed,
      child: Text(
        '$title',
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            letterSpacing: 2),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color? shadowColor;
  final void Function() pressed;

  const DefaultButton({
    Key? key,
    required this.title,
    required this.color,
    required this.pressed,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: SizedBox(
        height: 50,
        width: 250,
        child: MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              40,
            ),
          ),
          color: color,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: pressed,
        ),
      ),
    );
  }
}

CarouselOptions carouselOptions() {
  return CarouselOptions(
    height: 400,
    viewportFraction: 1,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 5),
    autoPlayAnimationDuration: const Duration(seconds: 1),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
  );
}


ToastFuture showToastState({
  required String text,
  required BuildContext? context,
  required ToastStates? state,
}) {
  return showToast(
    text,
    backgroundColor: chooseToastColor(state!),
    context: context,
    duration: const Duration(seconds: 3),
    borderRadius: BorderRadius.circular(20),
    animation: StyledToastAnimation.slideFromBottom,
    reverseAnimation: StyledToastAnimation.slideFromBottom,
    curve: Curves.fastLinearToSlowEaseIn,
    isHideKeyboard: true,
  );
}

enum ToastStates {success , error , warning}

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
  }
  return color;
}



