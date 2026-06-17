import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/theme/app_theme_provider.dart';

class CollapsibleSidebar extends StatefulWidget {
  final Widget child;

  const CollapsibleSidebar({
    super.key,
    required this.child,
  });

  @override
  State<CollapsibleSidebar> createState() => _CollapsibleSidebarState();
}

class _CollapsibleSidebarState extends State<CollapsibleSidebar> {
  final Color backgroundColor = Colors.white;
  final Color dividerColor = Color(0xFFF5E8D8);
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Container
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isCollapsed ? 70 : 240,
            color: backgroundColor,
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Toggle Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: SvgPicture.asset('icons/layout_grid.svg', width: 30, height: 30),
                      ),
                      if (!isCollapsed) ...[
                        const SizedBox(width: 10),
                        Text(
                          'Recursos Humanos',
                          style: TextTheme.of(context).titleSmall?.copyWith(
                            color: Color(0xFF9A7B5A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                Divider(color: dividerColor),
                // Navigation Items
                _buildNavItem(LucideIcons.clock, 'Ingreso', true),
                _buildNavItem(LucideIcons.megaphone, 'Avisos', false),
                _buildNavItem(LucideIcons.fileText, 'Actas', false),
                _buildNavItem(LucideIcons.users, 'Empleados', false),
                _buildNavItem(LucideIcons.alertCircle, 'Incidencias', false),
                _buildNavItem(LucideIcons.settings2, 'Automatización', false),
                const SizedBox(height: 20),
                IconButton.outlined(
                  icon: Icon(
                    isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    color: primaryColor,
                    size: 12,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFFFFF0DC),
                    side: BorderSide(color: Color(0xFFFDDEB0)),
                  ),
                  onPressed: () => setState(() => isCollapsed = !isCollapsed),
                ),
              ],
            ),
          ),
          // Main Content View
          Expanded(
            child: Center(
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool selected) {
    final Color textColor = Color(0xFF9A7B5A);

    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: selected ? Colors.white : primaryColor,
            size: 20,
          ),
          title: isCollapsed 
              ? null 
              : Text(
                  label,
                  style: TextTheme.of(context).labelLarge?.copyWith(
                    color: selected ? Colors.white : textColor,
                  ),
                ),
          selected: selected,
          tileColor: Colors.white,
          selectedTileColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}