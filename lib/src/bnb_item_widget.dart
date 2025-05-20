part of '../bnb_flutter.dart';

class BnbItemWidget extends StatefulWidget {
  final int index;
  final IconData? iconData;
  final String? assetImage;
  final Widget? icon;
  final Function(int) onTap;

  const BnbItemWidget({
    super.key,
    this.iconData,
    this.assetImage,
    required this.onTap,
    this.icon,
    required this.index,
  }) : assert(iconData == null && assetImage == null && icon == null);

  @override
  State<BnbItemWidget> createState() => _BnbItemWidgetState();
}

class _BnbItemWidgetState extends State<BnbItemWidget> {
  @override
  Widget build(BuildContext context) {
    return _BnbAnimatedIconButton(
      index: widget.index,
      onTap: widget.onTap,
      icon: widget.icon,
      assetImage: widget.assetImage,
      iconData: widget.iconData,
    );
  }
}
