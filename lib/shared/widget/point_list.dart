import 'package:flutter/material.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

class PointList extends StatelessWidget {
  const PointList({
    super.key,
    required this.data,
    this.onTap,
  });

  final List<Point> data;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final point = data[index];
        return InkWell(
          onTap: onTap == null ? null : () => onTap!.call(index),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'lat: ${point.coordinate.latitude} / lng: ${point.coordinate.longitude}',
                ),
                if (point.comment.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(point.comment),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
