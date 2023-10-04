import 'package:beauty_salon/src/provider/Booking/BookingProvider.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:beauty_salon/src/provider/Notifactions/NotifactionsProvider.dart';
import 'package:beauty_salon/src/provider/Reservations/ReservationsProvider.dart';
import 'package:beauty_salon/src/provider/chat/chateProvider.dart';
import 'package:beauty_salon/src/provider/genral/aboutProvider.dart';
import 'package:beauty_salon/src/splach_page.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../main.dart';
import 'Helpers/connectivity_service.dart';
import 'Repository/networkUtlis.dart';
import 'provider/auth/authProvider.dart';
BuildContext appContext ;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appContext = context;
    return Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NetworkUtil()),
          ChangeNotifierProvider(create: (_) => AboutProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => BookingProvider()),
          ChangeNotifierProvider(create: (_) => NotifactionsProvider()),
          ChangeNotifierProvider(create: (_) => ReservationsProvider()),
          ChangeNotifierProvider(create: (_) => ChateProvider()),
          StreamProvider<ConnectivityStatus>(
              create: (_) =>
              ConnectivityService().connectionStatusController.stream,
              initialData: ConnectivityStatus.Offline),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            CountryLocalizations.delegate, ...context.localizationDelegates,
          ],
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          debugShowCheckedModeBanner: false,
          title: '',
          navigatorKey: navigator,
          home: SplashPage(),
        ),
      ),
    );
  }
}
