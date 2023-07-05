import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/chat_space_model/chat_space_model.dart';

Widget chatRightItem(ChatSpaceModel item, bool isSameUser) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
    alignment: Alignment.topRight,
    child: Stack(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 230.w,
            maxHeight: 1500.w,
          ),
          padding: EdgeInsets.only(
            bottom: 13.w,
            top: 5.w,
            right: 35.w,
            left: 12.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
              bottomRight: Radius.circular(2.r),
            ),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Text(
            item.message,
            maxLines: 10,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
