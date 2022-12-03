part of 'widget.dart';

class ShimmerHeaderLoading extends StatelessWidget {
  const ShimmerHeaderLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 180,
                        height: 100,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
