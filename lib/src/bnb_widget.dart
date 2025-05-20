import 'package:bnb_flutter/bnb_flutter.dart';
import 'package:flutter/material.dart';

class BnbWidget extends StatefulWidget {
  final List<BnbItemWidget> items;
  final BnbStyle? style;
  final Function(int) onTap;

  const BnbWidget({
    super.key,
    required this.items,
    this.style,
    required this.onTap,
  }) : assert(items.length > 0 && items.length <= 5);

  @override
  State<BnbWidget> createState() => _BnbWidgetState();
}

class _BnbWidgetState extends State<BnbWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.maxFinite, double.maxFinite),
            painter: BNBCustomPainter(theme.colorScheme.primary),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items
                  .map(
                    (e) => Align(
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
                              child: e,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          /*Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomAnimatedIconButton(
                    onTap: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      color: theme.colorScheme.onPrimary,
                      size: 24,
                    ),
                  ),
                  CustomAnimatedIconButton(
                    onTap: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      color: theme.colorScheme.onPrimary,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                  ),
                  CustomAnimatedIconButton(
                    onTap: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      color: theme.colorScheme.onPrimary,
                      size: 24,
                    ),
                  ),
                  CustomAnimatedIconButton(
                    onTap: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      color: theme.colorScheme.onPrimary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),*/
          /*Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: const Size(60, 60),
                      painter:
                          BNBCenterCustomPainter(theme.colorScheme.primary),
                    ),
                    Center(
                      child: CustomAnimatedIconButton(
                        onTap: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.house,
                          color: theme.colorScheme.onPrimary,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
