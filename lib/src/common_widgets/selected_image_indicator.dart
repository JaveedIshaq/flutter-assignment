import 'package:flutter/material.dart';
import 'package:luvit/src/core/constants/app_colors.dart';

class SelectedImageIndicator extends StatefulWidget {
  final int selectedIndex;
  final int itemCount;
  final Function(int)? onItemSelected;

  const SelectedImageIndicator(
      {super.key,
      required this.selectedIndex,
      this.onItemSelected,
      this.itemCount = 5});

  @override
  State<SelectedImageIndicator> createState() => _SelectedImageIndicatorState();
}

class _SelectedImageIndicatorState extends State<SelectedImageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.itemCount, (index) {
          bool isSelected = index == widget.selectedIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (widget.onItemSelected != null) {
                  widget.onItemSelected!(index);
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 3,
                decoration: ShapeDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          begin: Alignment(0.75, -0.67),
                          end: Alignment(-0.75, 0.67),
                          colors: [
                            AppColors.primaryColor,
                            AppColors.primaryLight
                          ],
                        )
                      : null,
                  color: isSelected ? null : AppColors.black31,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
                //large bottom margin to increase the clickable area
                margin: const EdgeInsets.only(
                  left: 2.0,
                  right: 2.0,
                  top: 5.0,
                  bottom: 20.0,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
