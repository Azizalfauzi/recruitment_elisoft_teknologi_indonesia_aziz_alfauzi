part of 'widget.dart';

class WidgetContent extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final DateTime dtime;
  const WidgetContent({
    Key? key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.dtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 100,
      decoration: BoxDecoration(
        color: kgreenColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      scale: 1.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    style: blackTextStyleInter.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              subtitle,
              style: blackTextStyleInter.copyWith(
                fontWeight: light,
              ),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                convertFormatDate(dtime),
                style: blackTextStyleInter.copyWith(fontWeight: light),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
