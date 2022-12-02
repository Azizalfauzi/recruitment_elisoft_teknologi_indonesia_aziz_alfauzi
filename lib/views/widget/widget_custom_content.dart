part of 'widget.dart';

class WidgetContent extends StatelessWidget {
  const WidgetContent({Key? key}) : super(key: key);

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
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(
                      image: AssetImage('assets/images/ic_login.png'),
                      scale: 1.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'hello world pppppppppppppppppppp ppppppppppppppppppppp',
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
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
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
                '08 April 2022',
                style: blackTextStyleInter.copyWith(fontWeight: light),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
