part of '../bnb_flutter.dart';

class _BnbItemWidget extends StatefulWidget {
  final int index;
  final bool isSelected;
  final IconData? iconData;
  final String? assetImage;
  final Widget? icon;
  final BnbStyle? style;
  final Function(int) onTap;

  const _BnbItemWidget({
    super.key,
    this.iconData,
    this.assetImage,
    required this.onTap,
    this.icon,
    required this.index,
    this.style,
    required this.isSelected,
  }) : assert((iconData == null && assetImage == null && icon == null)
            ? false
            : true);

  @override
  State<_BnbItemWidget> createState() => _BnbItemWidgetState();
}

class _BnbItemWidgetState extends State<_BnbItemWidget> {
  @override
  Widget build(BuildContext context) {
    return _BnbAnimatedIconButton(
      index: widget.index,
      isSelected: widget.isSelected,
      style: widget.style,
      onTap: widget.onTap,
      icon: widget.icon,
      assetImage: widget.assetImage,
      iconData: widget.iconData,
    );
  }
}
