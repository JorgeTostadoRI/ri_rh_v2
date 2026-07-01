import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({
    super.key,
    this.width,
    this.height,
    this.onChanged,
  });

  final double? width;
  final double? height;
  final void Function(PlatformFile?)? onChanged;

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  PlatformFile? _selectedFile;

  bool _hovering = false;

  double get _scale => _hovering ? 1.1 : 1;
  Color get _borderColor => _hovering ? primaryColor : borderColor;
  Color get _fillColor => _hovering ? inputFillColor.withAlpha(20) : inputFillColor;
  double get _opacity => _hovering ? 1 : 0;

  Future<void> selectFileHandler() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['png', 'jpeg', 'jpg'],
      withData: true,
      allowMultiple: false,
    );

    if (result != null) {
      final file = result.files.first;
      _updateFile(file);
    }
  }

  void _updateFile(PlatformFile? file) {
    setState(() => _selectedFile = file);
    if (widget.onChanged != null) widget.onChanged!(file);
  }

  Widget _noFileContainer() {
    return GestureDetector(
      onTap: selectFileHandler,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
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

  Widget _imagePreview() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: .center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.memory(
              _selectedFile!.bytes!,
              fit: .cover,
              repeat: .noRepeat,
              width: widget.width,
              height: widget.height,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 200),
              child: Container(
                color: Colors.black26,
              ),
            ),
          ),
          if (_hovering)
            Material(
              shape: const CircleBorder(),
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  color: errorColor,
                  onPressed: () => _updateFile(null),
                  icon: Icon(LucideIcons.trash),
                ),
              ),
            ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Builder(
        builder: (context) {
          if (_selectedFile == null) {
            return _noFileContainer();
          }
      
          return _imagePreview();
        }
      ),
    );
  }
}
