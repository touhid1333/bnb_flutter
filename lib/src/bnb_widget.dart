part of '../bnb_flutter.dart';

class BnbWidget extends StatefulWidget {
  final List<BnbItem> items;
  final int selectedIndex;
  final BnbStyle? style;
  final Function(int) onTap;

  const BnbWidget({
    super.key,
    required this.items,
    this.style,
    required this.onTap,
    required this.selectedIndex,
  }) : assert(items.length > 0 && items.length <= 5);

  @override
  State<BnbWidget> createState() => _BnbWidgetState();
}

class _BnbWidgetState extends State<BnbWidget> {
  double _previousIndex = 0;

  @override
  void didUpdateWidget(covariant BnbWidget oldWidget) {
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _previousIndex = oldWidget.selectedIndex.toDouble();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(
                begin: _previousIndex, end: widget.selectedIndex.toDouble()),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            builder: (context, value, child) => CustomPaint(
              size: const Size(double.maxFinite, double.maxFinite),
              painter: BNBCustomPainter(
                widget.style?.backgroundColor ?? theme.colorScheme.primary,
                value,
                widget.items.length,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < widget.items.length; i++) ...[
                  Expanded(
                    child: i == widget.selectedIndex
                        ? Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: const Size(60, 60),
                                    painter: BNBCenterCustomPainter(
                                        theme.colorScheme.primary),
                                  ),
                                  Center(
                                    child: _BnbAnimatedIconButton(
                                      onTap: widget.onTap,
                                      index: i,
                                      isSelected: i == widget.selectedIndex,
                                      style: widget.style,
                                      iconData: widget.items[i].iconData,
                                      assetImage: widget.items[i].assetImage,
                                      icon: widget.items[i].icon,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 60,
                              child: Center(
                                child: _BnbAnimatedIconButton(
                                  onTap: widget.onTap,
                                  index: i,
                                  isSelected: i == widget.selectedIndex,
                                  style: widget.style,
                                  iconData: widget.items[i].iconData,
                                  assetImage: widget.items[i].assetImage,
                                  icon: widget.items[i].icon,
                                ),
                              ),
                            ),
                          ),
                  )
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
