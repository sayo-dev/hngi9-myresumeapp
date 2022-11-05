import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:rezumi/utils/components/theme.dart';
import '../utils/components/change_theme_button.dart';
import '../utils/constants/color.dart';
import '../utils/constants/font.dart';
import '../utils/resuables.dart';
import '../utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final twitterUrl = Uri.parse('https://twitter.com/ollu_sayo');
  final githubUrl = Uri.parse('https://github.com/sayo-dev');
  final linkedInUrl = Uri.parse('https://linkedin.com/in/akinlade-samuel');

  void _launchTwitter() async => await canLaunchUrl(twitterUrl) ?
  launchUrl(twitterUrl, mode: LaunchMode.externalApplication) :  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: kText(
    text: 'Can\'t launch twitter',
    family: FontFamily.kSansRegular,
    size: 14,
  )));
  void _launchGithub() async => await canLaunchUrl(githubUrl) ?
  launchUrl(githubUrl, mode: LaunchMode.externalApplication) : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: kText(
    text: 'Can\'t launch github',
    family: FontFamily.kSansRegular,
    size: 14,
  )));
  void _launchLinkedIn() async => await canLaunchUrl(linkedInUrl) ? launchUrl(linkedInUrl, mode: LaunchMode.externalApplication)
  : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: kText(
    text: 'Can\'t launch linkedIn',
    family: FontFamily.kSansRegular,
    size: 14,
  )));

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeNotifier = LocaleNotifier.of(context);
    SizeConfig.init(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.sunny,
                    size: getProportionateScreenWidth(14),
                    color: themeProvider.isDarkMode
                        ? Palette.kLightColor
                        : Colors.orange,
                  ),
                  ChangeThemeButton(),
                  Icon(
                    Icons.brightness_3,
                    size: getProportionateScreenWidth(14),
                    color: themeProvider.isDarkMode
                        ? Colors.orange
                        : Palette.kDarkColor,
                  ),
          PopupMenuButton(
            icon: Icon(
              Icons.language_outlined
            ),
              itemBuilder: (value) => [
                PopupMenuItem(
                  onTap: (){
                    localeNotifier?.change('en');
                  },
                    child: kText(
                      text: 'English',
                      family: FontFamily.kSansRegular,
                      size: 14,
                    )),
                PopupMenuItem(
                    onTap: (){
                      localeNotifier?.change('ar');
                    },
                    child: kText(
                      text: 'Arabic',
                      family: FontFamily.kSansRegular,
                      size: 14,
                    )),
                PopupMenuItem(
                    onTap: (){
                      localeNotifier?.change('fr');
                    },
                    child: kText(
                      text: 'French',
                      family: FontFamily.kSansRegular,
                      size: 14,
                    )),
                PopupMenuItem(
                    onTap:(){
                      localeNotifier?.change('zh');
                    },
                    child: kText(
                      text: 'Chinese',
                      family: FontFamily.kSansRegular,
                      size: 14,
                    ))
              ])
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: getProportionateScreenHeight(80),
                    width: getProportionateScreenWidth(80),
                    decoration: BoxDecoration(
                        color: Palette.kGreyColor,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage('assets/images/pfp.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      kText(
                        text: 'Samuel Akinlade',
                        size: 20,
                        family: FontFamily.kSansBold,
                      ),
                      kText(
                        text: 'Akinsam',
                        size: 16,
                        family: FontFamily.kSansBold,
                      ),
                      kText(
                        text: 'Mobile Developer',
                        size: 16,
                        family: FontFamily.kSansRegular,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: getProportionateScreenWidth(18)),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          kText(
                            text: 'Ogun, Nigeria',
                            size: 16,
                            family: FontFamily.kSansRegular,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              kText(
                text:
                    'Tech enthusiast with up to 2 years experience in Mobile Development using Dart Programming Language and Flutter Framework.',
                size: 14,
                family: FontFamily.kSansRegular,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              kText(
                text: 'Skills',
                size: 18,
                family: FontFamily.kSansBold,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: kSkillCard(image: 'flutter', descp: 'Flutter')),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Expanded(child: kSkillCard(image: 'dart', descp: 'Dart')),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Expanded(child: kSkillCard(image: 'github', descp: 'Github')),
                  // kSkillCard(image: 'figma', descp: 'Figma'),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              kText(
                text: 'Experience',
                size: 18,
                family: FontFamily.kSansBold,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kChain(height: 50),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        kExp(
                            role: 'Mobile Developer',
                            title: 'Vast',
                            period: 'Aug 2022 - Present'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kChain(height: 50),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        kExp(
                            role: 'Mobile Developer',
                            title: 'CoinsKash',
                            period: 'March 2022 - July 2022'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kChain(height: 30),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        kExp(
                            role: 'Mobile Development Intern',
                            title: 'Grazac Academy',
                            period: 'Jan 2022 - March 2022'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              kText(
                text: 'What I can do',
                size: 18,
                family: FontFamily.kSansBold,
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              kText(
                text:
                    'With my above mentioned experience I believe I can bring to live whatever proposed product and deliver at the best taste.',
                size: 14,
                family: FontFamily.kSansRegular,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              kText(
                text: 'Socials',
                size: 18,
                family: FontFamily.kSansBold,
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: kSocialCard(
                     text: 'LinkedIn',
                       onTap: _launchLinkedIn
                   ),
                 ),
                 SizedBox(
                   width: getProportionateScreenWidth(5),
                 ),
                 Expanded(
                   child: kSocialCard(
                       text: 'Github',
                       onTap: _launchGithub
                   ),
                 ),
                 SizedBox(
                   width: getProportionateScreenWidth(5),
                 ),
                 Expanded(
                   child: kSocialCard(
                       text: 'Twitter',
                       onTap: _launchTwitter
                   ),
                 )
               ],
             )
            ],
          ),
        ),
      ),
    ));
  }

  GestureDetector kSocialCard({required String text, required VoidCallback onTap}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
                   width: getProportionateScreenWidth(100),
                   height: getProportionateScreenHeight(30),
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     color: themeProvider.isDarkMode ? Palette.kBlackColor : Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(8))
                   ),
                   child: kText(
                     text: text,
                     size: 14,
                     family: FontFamily.kSansBold,
                   ),
                 ),
    );
  }

  Column kExp(
      {required String role, required String title, required String period}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kText(
          text: role,
          size: 12,
          family: FontFamily.kSansBold,
        ),
        kText(
          text: title,
          size: 10,
          family: FontFamily.kSansBold,
        ),
        kText(
          text: period,
          size: 10,
          family: FontFamily.kSansRegular,
        ),
      ],
    );
  }

  Column kChain({required double height}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Container(
          height: getProportionateScreenHeight(10),
          width: getProportionateScreenWidth(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeProvider.isDarkMode
                  ? Palette.kLightColor
                  : Palette.kBlackColor),
        ),
        Container(
            height: getProportionateScreenHeight(height),
            width: getProportionateScreenWidth(2),
            color: themeProvider.isDarkMode
                ? Palette.kLightColor
                : Palette.kBlackColor)
      ],
    );
  }

  Container kSkillCard({required String descp, required String image}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: getProportionateScreenHeight(80),
      width: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
          color: themeProvider.isDarkMode ? Palette.kBlackColor : Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: getProportionateScreenHeight(20),
              width: getProportionateScreenWidth(20),
              child: Image.asset('assets/images/$image.png')),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          kText(
            text: descp,
            size: 14,
            family: FontFamily.kSansRegular,
          ),
        ],
      ),
    );
  }
}
