part of 'widget.dart';

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({Key? key}) : super(key: key);

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
              'header',
              style: blackTextStyleInter.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              'hello world pppppppppppppppppppp ppppppppppppppppppppp',
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
