//import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
import 'package:app/core/application/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomAppBarComponent extends ConsumerWidget {
  const BottomAppBarComponent({
    super.key,
    required this.currentScreenIndex,
  });
  final int currentScreenIndex;

  @override
  Widget build(BuildContext context, ref) {
    //var currenUser = ref.read(authNotifierProvider);

    String? profileUrl;
    return BottomAppBar(
      padding: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color:
                          currentScreenIndex == 0 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 0;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        color: currentScreenIndex == 0
                            ? Colors.black
                            : Colors.white,
                      ),
                      Text(
                        "Product",
                        style: TextStyle(
                          color: currentScreenIndex == 0
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color:
                          currentScreenIndex == 1 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 1;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        color: currentScreenIndex == 1
                            ? Colors.black
                            : Colors.white,
                      ),
                      Text(
                        "Orders",
                        style: TextStyle(
                          color: currentScreenIndex == 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color:
                          currentScreenIndex == 2 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 2;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2,
                        color: currentScreenIndex == 2
                            ? Colors.black
                            : Colors.white,
                      ),
                      Text(
                        "Reports",
                        style: TextStyle(
                          color: currentScreenIndex == 2
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color:
                          currentScreenIndex == 3 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 3;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ads_click,
                        color: currentScreenIndex == 3
                            ? Colors.black
                            : Colors.white,
                      ),
                      Text(
                        "Sales",
                        style: TextStyle(
                          color: currentScreenIndex == 3
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 3,
                      color:
                          currentScreenIndex == 4 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                child: MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  onPressed: () {
                    ref.read(navigationProvider.notifier).state = 4;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: unnecessary_null_comparison
                      if (profileUrl == null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Icon(
                            FontAwesomeIcons.userGear,
                            color: currentScreenIndex == 4
                                ? Colors.black
                                : Colors.white,
                          ),
                        )
                      else
                        Image.network(""),
                      Text(
                        "Settings",
                        style: TextStyle(
                          color: currentScreenIndex == 4
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
