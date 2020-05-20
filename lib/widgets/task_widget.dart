import 'package:ToDoApp/theme/app_theme.dart';
import 'package:ToDoApp/theme/light_color.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  @override
  _TaskWidgetsState createState() => _TaskWidgetsState();
}

class _TaskWidgetsState extends State<TaskWidget> {
  bool _isDone = false;
  bool _isNotifications = false;
  Color color = Colors.yellow;

  final double _round = 5 ;  
  final double _height = 60 ;  
  void _onTap() {
    setState(() {
      _isDone = !_isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: _height,
          decoration: BoxDecoration(
            color: LightColor.text3,
            borderRadius: BorderRadius.circular(_round),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RoundedCheckBox(
                isSelected: _isDone,
                onTap: _onTap,
              ),
              Text('dateTime'),
              Text(
                'taskName',
                style: AppTheme.h4Style.copyWith(
                    color: !_isDone
                        ? LightColor.titleText1
                        : LightColor.unselectIcon1,
                    decoration: _isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                ),
                color: _isNotifications
                    ? LightColor.colorPersonal
                    : LightColor.unselectIcon1,
                onPressed: () {
                  setState(() {
                    _isNotifications = !_isNotifications;
                  });
                },
              )
            ],
          ),
        ),
        Container(
          width: 6,
          height: _height,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_round),
                topLeft: Radius.circular(_round),
              )),
        ),
      ],
    );
  }
}

class RoundedCheckBox extends StatelessWidget {
  final Function onTap;
  final isSelected;

  const RoundedCheckBox(
      {Key key, @required this.onTap, @required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color:
                    isSelected ? Colors.transparent : LightColor.unSelectIcon2,
                width: 1.5),
            color: isSelected ? LightColor.colorTrue : Colors.transparent,
          ),
          child: isSelected
              ? Icon(
                  Icons.check,
                  size: 15.0,
                  color: LightColor.text3,
                )
              : Icon(
                  null,
                  size: 15.0,
                ),
        ),
      ),
    );
  }
}
