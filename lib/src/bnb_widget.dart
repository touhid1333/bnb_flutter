part of '../bnb_flutter.dart';

class BnbWidget extends StatefulWidget {
  ///
  /// ## Items
  ///
  /// Required List<[BnbItem]>
  final List<BnbItem> items;

  ///
  /// ## Current Index
  ///
  /// Type: [int]
  final int selectedIndex;

  ///
  /// ## Style
  ///
  /// [BnbStyle]
  ///
  /// Basic styles for the bottom navigation bar
  final BnbStyle? style;

  ///
  /// ## On Tap
  ///
  /// Do your necessary work in this function
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

class _BnbWidgetState extends State<BnbWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.maxFinite, double.maxFinite),
            painter: BNBCustomPainter(
              widget.style?.backgroundColor ?? theme.colorScheme.primary,
              widget.selectedIndex.toDouble(),
              widget.items.length,
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                widget.items.length,
                (i) {
                  return Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: i == widget.selectedIndex
                          ? GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                widget.onTap(i);
                              },
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
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    widget.onTap(i);
                                  },
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Center(
                                      child: _BnbAnimatedIconButton(
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
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
