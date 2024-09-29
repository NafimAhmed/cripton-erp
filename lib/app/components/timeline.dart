import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../models/timeline.dart';

// ignore: must_be_immutable
class PrimaryTimeLine extends StatelessWidget {
  const PrimaryTimeLine({
    super.key,
    required this.timelineItemList,
    this.color = Colors.white,
    this.havingOppositeContent = false,
    this.height = 160,
  });
  final List<TimelineModel> timelineItemList;
  final Color color;
  final bool havingOppositeContent;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Timeline.tileBuilder(
          shrinkWrap: true, // For non fix timeline
          theme: TimelineThemeData(
            direction: Axis.horizontal,
            connectorTheme: const ConnectorThemeData(
              space: 20,
              thickness: 4,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            itemExtent: ((320 /
                (timelineItemList.length.toDouble()))), //connector line length
            indicatorBuilder: (context, index) {
              TimelineModel timelineModel = timelineItemList[index];
              return timelineModel.status == 'Pending'
                  ? OutlinedDotIndicator(
                      borderWidth: 2, color: timelineModel.color)
                  : DotIndicator(color: timelineModel.color);
            },
            contentsAlign: ContentsAlign.basic,
            connectorBuilder: (context, index, connectorType) {
              TimelineModel timelineModel = timelineItemList[index];
              return SolidLineConnector(
                color: timelineModel.color,
              );
            },
            oppositeContentsBuilder: havingOppositeContent
                ? (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        timelineItemList[index].topTitle ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, color: timelineItemList[index].color),
                      ),
                    )
                : null,

            contentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                timelineItemList[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: timelineItemList[index].color),
              ),
            ),
            itemCount: timelineItemList.length,
          ),
        ),
      ),
    );
  }
}
