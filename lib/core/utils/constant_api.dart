class ConstantApi {
  static const String baseUrl = 'https://pileup.hmeitsolutions.com/api/pileup/';
  static const String dynamicLinkBaseUrl = 'https://pileup.hmeitsolutions.com';
  static const String login = "${baseUrl}login";
  static const String getFolders = "${baseUrl}folder";
  static const String getPilesImIn = "${baseUrl}user/pilesImIn";
  static   String getParticipants (String pileId) => "${baseUrl}pile/participants/${pileId}";
  static const String getMyProfile = "${baseUrl}user";
  static const String updateMyProfile = "${baseUrl}user/update";
  static const String getHomeCarousel = "${baseUrl}banners";
  static const String createPile = "${baseUrl}pile";

  static String editPile(String pileId) => "${baseUrl}pile/$pileId";

/////////////////////////////////////
  static const String myData = "${baseUrl}my-data";
  static const String verifyCode = "${baseUrl}Auth/validate-otp";
  static const String getBlogs = "${baseUrl}Blogs";
  static const String getMerchants = "https://apis.st-lr.com/api/stlr/showMyChannelsMerchants";
  static const String getVendors = "${baseUrl}Vendors";
  static const String getUserFolders = "${baseUrl}folder";
  static const String getType = "${baseUrl}type";
  static const String getMyWallet = "${baseUrl}MyWallet";

  static const String getFoldersBySearch = "${baseUrl}FoldersBySearch";
  static const String getPilesImInBySearch = "${baseUrl}PilesImInBySearch";
  static const String getNotifications = "${baseUrl}Notification";
  static const String getCalendar = "${baseUrl}Calendar";
  static const String getPileManagers = "${baseUrl}PilesManagers";


}
