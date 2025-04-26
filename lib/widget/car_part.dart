import 'package:car_controller/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CarPart extends StatelessWidget {
  final bool state;
  final String name;
  final VoidCallback onTap;
  const CarPart({super.key, required this.state, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 150,
      // Remove fixed width to allow the container to adapt to available space
      // width: 180,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: state ? Colors.blue : Colors.transparent,
              blurRadius: state ? 50 : 0,
            )
          ],
          color: state ? Colors.blue : Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          // Wrap this Column in Expanded to make it take only available space
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(name, 25, Colors.white, FontWeight.bold),
                const SizedBox(
                  height: 10,
                ),
                text(state ? "Opened" : "Closed", 20,
                    Colors.white.withOpacity(.5), FontWeight.bold),
              ],
            ),
          ),
          // Remove the first Spacer to save space
          // const Spacer(),

          // Keep the switch at a reasonable size
          Expanded(
            flex: 1,
            child: Transform.rotate(
              angle: -1.6,
              child: Transform.scale(
                // Reduce scale slightly if needed
                scaleX: 1.3,
                scaleY: 1.3,
                child: Switch(
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white.withOpacity(.1),
                  value: state,
                  onChanged: (value) => onTap(),
                ),
              ),
            ),
          ),
          // Keep some padding at the end
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}