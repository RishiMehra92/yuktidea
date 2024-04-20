import 'package:get/get.dart';
import 'package:yuktidea/presentation/onbording/view/countryListpage.dart';
import 'package:yuktidea/presentation/terms/view/TermsView.dart';
import '../presentation/home/homepage.dart';
import '../presentation/onbording/view/get_phone_number.dart';
import '../presentation/onbording/view/select_country.dart';
import '../presentation/onbording/view/select_options_screen.dart';
import '../presentation/onbording/view/verify_phone_number.dart';


class Routes {
  static const String initial = '/';

  static final routes = [
    GetPage(name: '/', page: () => SelectOptionsScreen()),
    GetPage(name: '/terms', page: () =>   TermsPage()),
    GetPage(name: '/countryList', page: () =>   CountryListPage()),
    GetPage(name: '/getPhoneNumber', page: () =>   const GetPhoneNumber()),
    GetPage(name: '/verifyPhoneNumber', page: () =>   VerifyPhoneNumber()),
    GetPage(name: '/selectCountry', page: () =>   const SelectCountry()),
    GetPage(name: '/homePage', page: () =>   const HomePage()),

    // Add more routes as needed
  ];

  static String getInitialRoute() {
    return initial;
  }

  static List<GetPage> getRoutes() {
    return routes;
  }
}
