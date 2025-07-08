import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
import 'package:app/settings/presentation/widgets/settings_card_widget.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //var currentUser = ref.watch(authNotifierProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsCardWidget(
            //profile
            onTap: () {
              // TODO
              BotToast.showText(
                text: "Soon",
              );
            },
            icon: Icon(Icons.person_pin_outlined),
            title: "Profile",
          ),
          // SettingsCardWidget(
          //   onTap: () {
          //     context.pushNamed("my_news");
          //   },
          //   icon: Icon(Icons.post_add),
          //   title: "My Posts",
          // ),
          SettingsCardWidget(
            // terms amd conditions
            onTap: () {
              context.push('/categoryScreen');
            },
            icon: Icon(Icons.article),
            title: "My Category",
          ),
          SettingsCardWidget(
            //about
            onTap: () {},
            icon: Icon(Icons.info),
            title: "About",
          ),
          SettingsCardWidget(
            //chees language
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  //return const LanguageDialogComponent();
                  return SizedBox();
                },
              );
            },
            icon: Icon(FontAwesomeIcons.language),
            title: "Language",
          ),
          SettingsCardWidget(
            //selectedTheme
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Select Theme"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //     SwitchListTile(
                        //  title: Text("Light"),
                        // value: ref.watch(themeModeProvider).name == "light",
                        // // onChanged: (value) {
                        //  ref.read(themeModeProvider.notifier).setThemeMode(
                        //     ThemeMode.light,
                        //   );
                        //  },
                        // ),
                        //  SwitchListTile(
                        //    title: Text("Dark"),
                        // value: ref.watch(themeModeProvider).name == "dark",
                        // onChanged: (value) {
                        //   ref.read(themeModeProvider.notifier).setThemeMode(
                        //         ThemeMode.dark,
                        //       );
                        // },
                        //  ),
                        //   SwitchListTile(
                        //   title: Text("System"),
                        // value: "system",
                        // groupValue: "",
                        //  onChanged: (value) {
                        // ref.read(themeModeProvider.notifier).setThemeMode(
                        //       ThemeMode.system,
                        //     );
                        //  },
                        // value: ref.watch(themeModeProvider).name == "system",
                        // ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.dark_mode),
            title: "Theme",
          ),
          SettingsCardWidget(
            // logout
            onTap: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
            icon: Icon(Icons.logout),
            title: "Log Out",
          ),
        ],
      ),
    );
  }
}
