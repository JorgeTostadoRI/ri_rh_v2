import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  bool _hovering = false;

  PlatformFile? _selectedFile;

  double get _scale => _hovering ? 1.1 : 1;
  Color get _borderColor => _hovering ? primaryColor : borderColor;
  Color get _fillColor => _hovering ? inputFillColor.withAlpha(20) : inputFillColor;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.6,
            color: _borderColor,
          ),
          borderRadius: BorderRadius.circular(16),
          color: _fillColor,
        ),
        child: Stack(
          alignment: .center,
          children: [
            AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 1),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: Icon(LucideIcons.upload, color: primaryColor),
              ),
            ),
            Align(
              alignment: .bottomCenter,
              child: Text(
                'Haz clic para subir una imagen',
                style: TextTheme.of(context).labelSmall?.copyWith(
                  fontWeight: .w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}