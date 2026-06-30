import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/avisos/viewmodels/avisos_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/box_container.dart';
import 'package:table_calendar/table_calendar.dart';

class AvisosCalendar extends StatelessWidget {
  const AvisosCalendar({
    super.key,
    required this.viewmodel,
  });

  final AvisosViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(LucideIcons.calendar, color: primaryColor, size: 18),
              ),
              Text(
                'Calendario de Avisos',
                style: TextStyle(
                  color: headingTextColor,
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: .w700,
                  height: 1.55,
                ),
              ),
            ],
          ),
          ListenableBuilder(
            listenable: viewmodel,
            builder: (context, _) {
              return TableCalendar(
                focusedDay: viewmodel.focusedDay,
                firstDay: viewmodel.firstDay,
                lastDay: viewmodel.lastDay,
                selectedDayPredicate: viewmodel.selectedDayPredicate,
                onDaySelected: viewmodel.onDaySelected,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: headingTextColor,
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: .w700,
                    height: 1.5,
                  ),
                  leftChevronIcon: Icon(LucideIcons.chevronLeft, color: headingTextColor),
                  rightChevronIcon: Icon(LucideIcons.chevronRight, color: headingTextColor),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(fontWeight: .w700, color: headingTextColor),
                  selectedDecoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(fontFamily: 'Inter', color: Colors.white),
                  defaultTextStyle: TextStyle(fontFamily: 'Inter', fontWeight: .w400, color: headingTextColor),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: labelTextColor,
                    fontFamily: 'Inter',
                    fontWeight: .w700,
                  ),
                  weekendStyle: TextStyle(
                    color: labelTextColor,
                    fontFamily: 'Inter',
                    fontWeight: .w700,
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
