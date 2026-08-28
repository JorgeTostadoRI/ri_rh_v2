import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionLabel extends StatefulWidget {
  const VersionLabel({
    super.key,
  });

  @override
  State<VersionLabel> createState() => _VersionLabelState();
}

class _VersionLabelState extends State<VersionLabel> {
  late final Future<PackageInfo> _packageInfoFuture;

  @override
  void initState() {
    super.initState();
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return FutureBuilder(
      future: _packageInfoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Text(
              'v${snapshot.data!.version}',
              style: textTheme.labelSmall,
            );
          }
        }
          
        return Text(
          'Cargando versión...',
          style: textTheme.labelSmall,
        );
      },
    );
  }
}