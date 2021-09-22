import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:liquid_demo/data/model/event.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/view/screen/home/widget/event_slider/event_slider_model.dart';

class EventSliderWidget extends StatefulWidget {
  const EventSliderWidget({Key? key}) : super(key: key);

  @override
  _EventSliderWidgetState createState() => _EventSliderWidgetState();
}

class _EventSliderWidgetState
    extends BaseState<EventSliderModel, EventSliderWidget> {
  final _height = 90.0;
  int _pageIndex = 0;

  @override
  void onModelReady() {
    model.loadData();
  }

  @override
  void didUpdateWidget(covariant EventSliderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    model.checkLocaleChange();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = Radius.circular(12);
    return Container(
        height: _height,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
                topLeft: borderRadius, topRight: borderRadius)),
        child: super.build(context));
  }

  @override
  Widget buildContentView(BuildContext context, EventSliderModel model) {
    return Stack(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                height: _height,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _pageIndex = index;
                  });
                }),
            items:
                model.events!.map((event) => EventItemWidget(event)).toList()),
        Positioned.fill(
          left: 14,
          bottom: LDimens.spacing8,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: PageIndicatorWidget(
                pageCount: model.events!.length, currentPage: _pageIndex),
          ),
        )
      ],
    );
  }
}

class EventItemWidget extends StatelessWidget {
  final Event event;

  const EventItemWidget(this.event);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: LDimens.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(event.title, style: theme.textTheme.subtitle1),
          const SizedBox(height: LDimens.spacing4),
          Text(event.description,
              style: theme.textTheme.bodyText1?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6)))
        ],
      ),
    );
  }
}

class PageIndicatorWidget extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const PageIndicatorWidget({required this.pageCount, this.currentPage = 0});

  @override
  Widget build(BuildContext context) {
    final size = 6.0;
    final color = Theme.of(context).primaryColor;
    return Row(
        children: List.generate(
            pageCount,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                        color: index == currentPage
                            ? color
                            : color.withOpacity(0.5),
                        shape: BoxShape.circle),
                  ),
                )));
  }
}
