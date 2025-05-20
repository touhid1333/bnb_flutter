part of '../bnb_flutter.dart';

class _BnbAnimatedIconButton extends StatefulWidget {
  final int index;
  final IconData? iconData;
  final String? assetImage;
  final Widget? icon;
  final Function(int) onTap;

  const _BnbAnimatedIconButton(
      {super.key,
      required this.index,
      this.iconData,
      this.assetImage,
      this.icon,
      required this.onTap});

  @override
  State<_BnbAnimatedIconButton> createState() => _BnbAnimatedIconButtonState();
}

class _BnbAnimatedIconButtonState extends State<_BnbAnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        var result = _controller.reverse(); // Animate back to original
        result.whenComplete(() {
          _controller.reset();
          widget.onTap(widget.index);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.reset();
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final scale = 1 + (_animation.value * 0.3);
        final tilt = _animation.value * 0.1;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // perspective
            ..rotateX(tilt)
            ..rotateY(tilt)
            ..scale(scale),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: _onTap,
            child: widget.icon ??
                (widget.iconData != null
                    ? Icon(
                        widget.iconData!,
                        color: Colors.white,
                      )
                    : widget.assetImage != null
                        ? Image.asset(widget.assetImage!)
                        : Text("${widget.index}")),
          ),
        );
      },
    );
  }
}
