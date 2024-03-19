import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:workundo_hrms/utils/colors.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  String _formatWeekday(DateTime date, dynamic locale) {
    return DateFormat('E').format(date).substring(0,1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.67),
          border: Border.all(
            color: Colors.white,
            width: 0.1,
          ),
          color: textFieldBlack,
        ),
        height: 242,
        margin: const EdgeInsets.only(left: 22, right: 22),
        padding: const EdgeInsets.only(top: 15, left: 28, right: 28),
        child: TableCalendar(
          rowHeight: 25,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarFormat: CalendarFormat.month,
          headerVisible: true,
          headerStyle: const HeaderStyle(
            headerMargin: EdgeInsets.only(left: 14),
            titleCentered: false,
            formatButtonVisible: false,
            rightChevronVisible: false,
            leftChevronVisible: false,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
              fontFamily: 'Clash',
            ),
          ),
          daysOfWeekHeight: 20,
          calendarStyle: const CalendarStyle(
            isTodayHighlighted: false,
            todayTextStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
            weekendTextStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
            weekNumberTextStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
            rangeEndTextStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
            withinRangeTextStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
            outsideTextStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
              color: textFieldBlack
            ),
            defaultTextStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
            weekendStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'Clash',
              fontWeight: FontWeight.w500,
            ),
            // Assign the custom formatter to the dowTextFormatter property
            dowTextFormatter: _formatWeekday,
          ),
        ),
      ),
    );
  }
}
