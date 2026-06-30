import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/box_container.dart';

class AvisosListView extends StatelessWidget {
  const AvisosListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Avisos para el 30 de junio',
            style: TextStyle(
              color: headingTextColor,
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: .w700,
              height: 1.4,
            ),
          ),
          Text(
            '2 avisos programados',
            style: TextTheme.of(context).titleSmall,
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 300,
            child: ListView(
              children: [
                AvisoCard(content: 'Reunión general a las 10:00 AM en sala A'),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: AvisoCard(content: 'Recuerda actualizar tu expediente digital'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvisoCard extends StatelessWidget {
  const AvisoCard({
    super.key,
    required this.content,
    this.attachment,
  });

  final String content;
  final String? attachment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFFDF6EE),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: borderColor,
          width: 0.8,
        ),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  color: headingTextColor,
                  fontSize: 14,
                  fontWeight: .w700,
                  height: 1.625,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}