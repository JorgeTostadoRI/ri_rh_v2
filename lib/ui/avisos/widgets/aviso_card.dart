import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/aviso_form_dialog.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/hoverable.dart';

class AvisoCard extends StatefulWidget {
  const AvisoCard({
    super.key,
    required this.aviso,
    required this.onUpdate,
    required this.onDelete,
  });

  final Aviso aviso;
  final void Function(Aviso aviso)? onUpdate;
  final void Function(int id)? onDelete;

  @override
  State<AvisoCard> createState() => _AvisoCardState();
}

class _AvisoCardState extends State<AvisoCard> {
  bool _hovering = false;
  
  Color get _bgColor => _hovering ? Colors.white : const Color(0xFFFDF6EE);

  String _sanitizeUrl(String url) {
    if (kDebugMode) return url;
    return url.startsWith('http://') ? url.replaceFirst('http://', 'https://') : url;
  }

  @override
  Widget build(BuildContext context) {
    return Hoverable(
      onHover: (isHovering) => setState(() => _hovering = isHovering),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _bgColor,
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
                Expanded(
                  child: Text(
                    widget.aviso.content,
                    style: TextStyle(
                      color: headingTextColor,
                      fontSize: 14,
                      fontWeight: .w700,
                      height: 1.625,
                      overflow: .ellipsis,
                    ),
                  ),
                ),
                if (_hovering) ...[
                  if (widget.onUpdate != null)
                    IconButton(
                      iconSize: 16,
                      tooltip: 'Editar',
                      onPressed: () async {
                        final updatedAviso = await showDialog<Aviso>(
                          context: context,
                          builder: (context) {
                            return AvisoFormDialog(
                              aviso: widget.aviso,
                              day: widget.aviso.showAt,
                            );
                          }
                        );
                        if (updatedAviso != null) {
                          widget.onUpdate!(updatedAviso);
                        }
                      },
                      icon: Icon(LucideIcons.pen),
                    ),
                  if (widget.onDelete != null)
                    IconButton(
                      iconSize: 16,
                      tooltip: 'Eliminar',
                      onPressed: () => widget.onDelete!(widget.aviso.id!),
                      icon: Icon(LucideIcons.trash),
                    ),
                ],
              ],
            ),
            if (widget.aviso.attachment != null)
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.network(
                  _sanitizeUrl(widget.aviso.attachment!),
                  width: double.infinity,
                  height: 150,
                  fit: .cover,
                  repeat: .noRepeat,
                ),
              ),
          ],
        ),
      ),
    );
  }
}