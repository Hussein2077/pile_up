import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:table_calendar/table_calendar.dart';
class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: homeAppBar(context, bottom: false,leading: false,widget: CustomText(
        text: StringManager.calender.tr(),
        color: Colors.white,
        fontSize: AppSize.defaultSize!*2.4,
        fontWeight: FontWeight.w700,
      )),
      body: TableCalendar(
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonShowsNext: bool.fromEnvironment(''),
        ),
        availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day) => isSameDay(day, today),
        focusedDay: today,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2050, 10, 16),
        onDaySelected: _onDaySelected,
      ).animate().fade().scale(),
    );
  }
}
