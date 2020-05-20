import 'package:ToDoApp/theme/light_color.dart';
import 'package:flutter/material.dart';

enum KindTask { Personal, Work, Meeting, Study, Shopping }

const Map<KindTask, Color> tasksColor = const {
  KindTask.Personal: LightColor.colorPersonal,
  KindTask.Work: LightColor.colorWork,
  KindTask.Meeting: LightColor.colorMeeting,
  KindTask.Study: LightColor.colorStudy,
  KindTask.Shopping: LightColor.colorShopping,
};
