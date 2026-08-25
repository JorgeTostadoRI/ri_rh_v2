import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/config/assets.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/auth/login/viewmodels/login_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/command_button.dart';
import 'package:ri_rh_v2/ui/core/ui/elevated_container.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool showPassword = false;
  late final Future<PackageInfo> packageInfoFuture;

  void _onResult() {
    if (widget.viewmodel.login.completed) {
      widget.viewmodel.login.clearResult();
      context.read<NotificationViewmodel>().load.execute(); // refresh notification count
      context.go(Routes.home);
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
    packageInfoFuture = PackageInfo.fromPlatform();
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
    final textTheme = TextTheme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            spacing: 24,
            children: [
              ElevatedContainer(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 24,
                              color: Color.fromARGB(82, 232, 123, 30),
                            ),
                          ],
                        ),
                        alignment: .center, // prevents the container from resizing the svg
                        child: SvgPicture.asset(Assets.layoutGrid, width: 30, height: 30),
                      ),
                    ),
                    Text(
                      'Recursos Humanos',
                      style: textTheme.headlineMedium,
                    ),
                    Text(
                      'R&I AUTOMATION',
                      style: textTheme.labelLarge,
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      width: 400,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          spacing: 20,
                          children: [
                            TextFormField(
                              controller: _username,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                    
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'USUARIO',
                                hintText: 'Ingresa tu usuario',
                              ),
                              textInputAction: .next,
                            ),
                            TextFormField(
                              controller: _password,
                              obscureText: !showPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                    
                                return null;
                              },
                              textInputAction: .done,
                              onFieldSubmitted: (_) => _login(),
                              decoration: InputDecoration(
                                labelText: 'CONTRASEÑA',
                                hintText: 'Ingresa tu contraseña',
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() => showPassword = !showPassword),
                                  icon: Icon(
                                    showPassword ? LucideIcons.eyeOff : LucideIcons.eye,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommandButton.icon(
                                    command: widget.viewmodel.login,
                                    onPressed: _login,
                                    icon: Icon(LucideIcons.logIn),
                                    label: Text('Ingresar'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: packageInfoFuture,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      widget.viewmodel.login.execute((
        _username.text,
        _password.text,
      ));
    }
  }
}