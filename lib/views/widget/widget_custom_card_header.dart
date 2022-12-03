part of 'widget.dart';

class WidgetHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const WidgetHeader({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 2,
              style: blackTextStyleInter.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            Text(
              subtitle,
              maxLines: 4,
              style: blackTextStyleInter.copyWith(
                fontWeight: light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
