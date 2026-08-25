import 'package:flutter/material.dart';
import 'package:ri_rh_v2/utils/command.dart';

class CommandButton extends StatelessWidget {
  /// Builds an [ElevatedButton] which listens to a [Command], if the command is
  /// running then a [CircularProgressIndicator] is shown and the [onPressed]
  /// is not triggered when the button is pressed.
  const CommandButton({
    super.key,
    this.style,
    required this.command,
    required this.onPressed,
    required this.child,
  }) : icon = null;

  final ButtonStyle? style;
  final Command command;
  final void Function()? onPressed;
  final Widget child;
  final Widget? icon;

  /// Builds an [ElevatedButton] from a pair of [label] and [icon] that listens
  /// to a [Command].
  const CommandButton.icon({
    super.key,
    required this.command,
    required this.onPressed,
    required Widget label,
    this.style,
    this.icon,
  }) : child = label;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return _CommandButtonWithIcon(
        command: command,
        label: child,
        icon: icon!,
        onPressed: onPressed,
        buttonStyle: style,
      );
    }

    return ListenableBuilder(
      listenable: command,
      builder: (context, _) {
        if (command.running) {
          return ElevatedButton(
            onPressed: () {},
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
          );
        }

        return ElevatedButton(
          onPressed: onPressed,
          child: child,
        );
      }
    );
  }

}

class _CommandButtonWithIcon extends StatelessWidget {
  const _CommandButtonWithIcon({
    required this.command,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.buttonStyle,
  });

  final Command command;
  final Widget label;
  final Widget icon;
  final void Function()? onPressed;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: command,
      builder: (context, _) {
        if (command.running) {
          return ElevatedButton.icon(
            style: buttonStyle,
            onPressed: () {},
            icon: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
            label: label,
          );
        }

        return ElevatedButton.icon(
          style: buttonStyle,
          onPressed: onPressed,
          icon: icon,
          label: label,
        );
      },
    );
  }
}