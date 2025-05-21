part of '../bnb_flutter.dart';

class _BnbAnimatedIconButton extends StatelessWidget {
  final int index;
  final bool isSelected;
  final IconData? iconData;
  final String? assetImage;
  final Widget? icon;
  final BnbStyle? style;

  const _BnbAnimatedIconButton({
    super.key,
    required this.index,
    this.iconData,
    this.assetImage,
    this.icon,
    this.style,
    required this.isSelected,
  }) : assert((iconData == null && assetImage == null && icon == null)
            ? false
            : true);

  // -----------------------------------
  // Build
  // -----------------------------------
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return icon ??
        (iconData != null
            ? Icon(
                iconData!,
                color: isSelected
                    ? (style?.foregroundColor ?? theme.colorScheme.onPrimary)
                    : (style?.unSelectedForegroundColor ??
                        style?.foregroundColor ??
                        theme.colorScheme.onPrimary),
                size: style?.iconSize?.height ?? 16,
              )
            : assetImage != null
                ? Image.asset(
                    assetImage!,
                    color: isSelected
                        ? (style?.foregroundColor ??
                            theme.colorScheme.onPrimary)
                        : (style?.unSelectedForegroundColor ??
                            style?.foregroundColor ??
                            theme.colorScheme.onPrimary),
                    height: style?.iconSize?.height ?? 16,
                    width: style?.iconSize?.width ?? 16,
                  )
                : Text("$index"));
  }
}
