import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare/app/app.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch(
      {super.key,
      required this.datas,
      required this.selectedIndex,
      required this.onTap});
  final List<String> datas;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(50.w),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadowColor.withOpacity(0.16),
            offset: const Offset(0, 16),
            blurRadius: 24,
          )
        ],
      ),
      child: Row(
        children: datas
            .asMap()
            .entries
            .map(
              (e) => GestureDetector(
                onTap: () {
                  onTap.call(e.key);
                },
                child: Chip(
                  backgroundColor: selectedIndex == e.key
                      ? AppTheme.secondaryColor
                      : Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  label: Text(
                    e.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
