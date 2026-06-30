import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/auth/login/viewmodels/login_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';
import 'package:ri_rh_v2/ui/core/ui/form/field_label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.viewmodel,
  });

  final LoginViewmodel viewmodel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  void _onResult() {
    if (widget.viewmodel.login.completed) {
      widget.viewmodel.login.clearResult();
      context.go(Routes.incidencias);
    }

    if (widget.viewmodel.login.error) {
      widget.viewmodel.login.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se ha podido iniciar sesión'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    widget.viewmodel.login.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.login.removeListener(_onResult);
    widget.viewmodel.login.addListener(_onResult);
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          CollapsibleSidebar(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(40),
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      FieldLabel(labelText: 'Usuario', required: true),
                      TextField(controller: _username),
                      FieldLabel(labelText: 'Contraseña', required: true),
                      TextField(
                        controller: _password,
                        obscureText: true,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: .centerEnd,
                        child: ListenableBuilder(
                          listenable: widget.viewmodel.login,
                          builder: (context, _) {
                            return ElevatedButton(
                              onPressed: () {
                                if (_username.text.isEmpty || _password.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Ingresa tus credenciales')),
                                  );
                                  return;
                                }
                                widget.viewmodel.login.execute((
                                  _username.text,
                                  _password.text,
                                ));
                              },
                              child: Text('Ingresar'),
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}