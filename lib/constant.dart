import 'package:buzz/size_config.dart';
import 'package:flutter/material.dart';

// Colors
const darkOrange = Color(0xFFC53F3F);
const splashOrange = Color(0xFFFF725E);
const backgroundCream = Color(0xFFF2F0F0);
const black = Colors.black;
const navbarWhite = Color(0xFFFFFFFF);

// Keys
const kHost = 'identify-us-west-2.acrcloud.com';
const kAccessKey = '32e8b4a17a8e54e6dae651348bca2759';
const kAccessSecret = 'roU98fiFDzlWEWntK4LR9ccmM3QAAf6ywoqu9J6D';

// Spotify
const kClientId = 'bdeae17d554341acb8d42f860b0daddc';
const kClientSecret = '1a04860b135048ebbb1e75b1d20ebed1';

// Last FM
const kApiKey = '4d650695b06505f01e2f037bac3402a6';
const kSharedSecret = "4d650695b06505f01e2f037bac3402a6";

// Snackbar
/// Show Error SnackBar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    BuildContext context, String exception) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: darkOrange,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Text(
      exception,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.bold, color: backgroundCream),
    ),
    duration: const Duration(seconds: 3),
    elevation: 2,
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
  ));
}

/// Show Error SnackBar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: splashOrange,
    content: Text(
      message,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.bold, color: backgroundCream),
    ),
    duration: const Duration(seconds: 3),
    elevation: 2,
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    margin: EdgeInsets.only(
        bottom: SizeConfig.screenHeight! - 120,
        left: getProportionateScreenWidth(10),
        right: getProportionateScreenWidth(10)),
  ));
}
