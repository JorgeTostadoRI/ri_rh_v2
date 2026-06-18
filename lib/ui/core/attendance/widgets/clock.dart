import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late String _timeString;
  late Timer _timer;
  final DateFormat formatter = DateFormat.yMMMMEEEEd();

  @override
  void initState() {
    super.initState();
    _timeString = _formatTime(DateTime.now());
    // Update time every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timeString = _formatTime(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:"
        "${dateTime.minute.toString().padLeft(2, '0')}:"
        "${dateTime.second.toString().padLeft(2, '0')}";
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 12,
          children: [
            Center(
              child: Text(
                _timeString,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 108,
                  fontWeight: .w900,
                ),
              ),
            ),
            Text(
              formatter.format(DateTime.now()),
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: labelTextColor,
                fontWeight: .w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}