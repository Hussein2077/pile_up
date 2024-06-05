class ConstantApi {
  static const String baseUrl =
      'https://pileup.hmeitsolutions.com/api/pileup/';

  static const String login = "${baseUrl}login";
  static const String myData = "${baseUrl}my-data";
  static const String email = "email";
  static const String signUp = "${baseUrl}register";
  static const String sendCode = "${baseUrl}Auth/generate-otp";
  static const String verifyCode = "${baseUrl}Auth/validate-otp";
  static const String resetPassword  = "${baseUrl}Auth/reset-password-with-otp";
  static const String changePassword  = "${baseUrl}Auth/Change-password";

  static const String password = "password";

  static const String getBlogs = "${baseUrl}Blogs";
  static const String getMerchants = "${baseUrl}Merchants";
  static const String getVendors = "${baseUrl}Vendors";
  static const String getHomeCarousel = "${baseUrl}CarouselSliders";
  static const String getUserFolders = "${baseUrl}UsersFolders";
  static const String getMyProfile = "${baseUrl}MyProfile";
  static const String getMyWallet = "${baseUrl}MyWallet";
  static const String getFolders = "${baseUrl}Pile/GetAllPiles";
  static const String getFoldersBySearch = "${baseUrl}FoldersBySearch";
  static const String getPilesImIn = "${baseUrl}PilesImIn";
  static const String getPilesImInBySearch = "${baseUrl}PilesImInBySearch";
  static const String getNotifications = "${baseUrl}Notification";
  static const String getCalendar = "${baseUrl}Calendar";
  static const String getPileManagers = "${baseUrl}PilesManagers";


  //Post
  static const String createPile = "${baseUrl}Piles";
}
