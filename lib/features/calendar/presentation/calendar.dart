import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      appBar: homeAppBar(context,
          bottom: false,
          leading: false,
          widget: CustomText(
            text: StringManager.calendar.tr(),
            color: Colors.white,
            fontSize: AppSize.defaultSize! * 2.4,
            fontWeight: FontWeight.w700,
          )),
      body: TableCalendar(
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
              fontSize: AppSize.defaultSize! * 1.8,
              fontWeight: FontWeight.w700),
          leftChevronIcon: const Icon(
            Icons.chevron_left,
            color: AppColors.primaryColor,
          ),
          rightChevronIcon: const Icon(
            Icons.chevron_right,
            color: AppColors.primaryColor,
          ),
          formatButtonShowsNext: const bool.fromEnvironment(''),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
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
