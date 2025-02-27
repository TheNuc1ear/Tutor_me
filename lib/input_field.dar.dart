import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/classesEnrolled.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget widget;
  const MyInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    required this.widget,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: headingStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top:8.0),
            color: Colors.grey,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children:[
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false:true,
                    autofocus: false,
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:Colors.black,
                          width: 0
                        )
                      ) ,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:Colors.black,
                                width: 0
                            )
                    ),
                  )
                )
                ),
                widget == null?Container():Container(child:widget)
              ],
            )
          )
        ],
      )
    );
  }
}
