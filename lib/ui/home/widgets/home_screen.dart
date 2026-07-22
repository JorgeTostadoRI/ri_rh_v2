import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/home/viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.viewmodel,
  });

  final HomeViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return SingleChildScrollView(
      child: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(48),
              child: Column(
                spacing: 24,
                children: [
                  Text(
                    '¡Hola ${viewmodel.getUser()?.nombre ?? "Don Nadie"}!',
                    style: textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                    onPressed: () => viewmodel.logout.execute(),
                    child: Text('Cerrar sesión'),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}