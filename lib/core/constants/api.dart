class Api {
  static const baseUrl = "https://api.safriapp.com";
  static const register = "/delivery-men/create-delivery-man";
  static const login = "/delivery-men/login";
  static const uploadDocument = "/delivery-men/update-delivery-man-needed-info";
  static const logout = "/delivery-men/logout";

  static updateUserImage(String userID) =>
      "/delivery-men/update-delivery-man/$userID";

  static const updateUserStatus =
      "/delivery-men/change-delivery-man-online-status";

  static const getUserData = "/delivery-men/single-delivery-man-by-token";

  static getNotification(int pageNumber) =>
      "/notification/all-notifications?page=$pageNumber";
}
