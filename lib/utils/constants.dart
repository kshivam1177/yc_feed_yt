library constants;

const String SCREEN_EXPLORE = 'EXPLORE';
const String SCREEN_BUCKET_LIST = 'BUCKET_LIST';
const String SCREEN_COMMUNITY = 'COMMUNITY';
const String SCREEN_PROFILE = 'PROFILE';
const String SCREEN_EDIT_PROFILE = 'EDIT_PROFILE';
const String SCREEN_BECOME_MEMBER = 'BECOME_MEMBER';
const String SCREEN_GET_OTP = 'GET_OTP';
const String SCREEN_VERIFY_OTP = 'VERIFY_OTP';
const String SCREEN_LAUNCH = 'LAUNCH';
const String SCREEN_ONBOARDING = 'ONBOARDING';
const String SCREEN_TERMS = 'TERMS';
const String SCREEN_PRIVACY = 'PRIVACY';

// ERROR CONSTANTS
const String NO_INTERNET_AVAILABLE = 'Internet not available';
const String SOME_ERROR_OCCURRED = 'Something went wrong!';
const String INVALID_MOBILE_NUM = 'Invalid mobile number';
const String INVALID_EMAIL = 'Invalid email';
const String INVALID_NAME = 'Please Enter at least two character';
const String INVALID_NUM = 'Invalid number';
const String REQUIRED = 'Required';
const String CHARACTER_OVERFLOW = 'Please enter within 150 characters';
const String NOT_ALPHA = 'Please enter alphabets only';
const String EMPTY_FIELD = 'Required field is empty';
const String ACCEPTED = "OK";

// Popup and Dialogue
const String EXIT_APP = "Press back again to exit";

// Home Screen Navbar
enum NavbarItems {
  HOME,
  CALENDAR,
  EXPLORE,
  SEARCH,
  FEED,
  MORE,
}

extension NavbarItemsExt on NavbarItems {
  String get toStr => this.toString().split(".").last.toLowerCase();
}

// ONBOARDINGSTATUS
const int ONBOARDING_COMPLETE = 202;
const int ONBOARDING_INCOMPLETE = 201;
const int ONBOARDING_INIT = 200;

const int SUBSCRIPTION_EXTRA_DAYS = 15;

// DEVICE_EVENTS
const String USER_LOGIN = 'USER_LOGIN';
const String USER_LOGOUT = 'USER_LOGOUT';
const String LOAD_WITHOUT_USER = 'LOAD_WITHOUT_USER';

const String ENV_LOCAL = 'local';
const String ENV_DEV = 'development';
const String ENV_STAGE = 'staging';
const String ENV_PROD = 'production';

enum ClassJoinedFrom { PREVIEW, LIVE, PLAYBACK }

extension ClassJoinedFromExt on ClassJoinedFrom {
  String get toStr => this.toString().split(".").last;
}

const bool SHOW_DASHBOARD_PRE_LOGIN = true;

const int DELAY_FOR_SHOWING_POPUP_AFTER_SPLASH = 10;

const String SHARE_FEED =
    "Check out what kids are learning on Yellow Class. Here is the link ";

const Map<String, String> queryNameToHeaderKeyMap = <String, String>{
  "getOtpMutation": "user",
  "getOTPViaWhatsAppMutation": "user",
  "verifyOTPMutation": "user",
  "updategCalIdMutation": "program",
  "likePostMutation": "post",
  "reportPostMutation": "post",
  "deletePostMutation": "post",
  "createPostMutation": "post",
  "addMessageMutation": "chat",
  "addLiveEmojiMutation": "live-class",
  "manageClassParticipantMutation": "live-class",
  "submitPollAnswerMutation": "live-class",
  "getPollResultMutation": "live-class",
  "giveClassFeedbackMsgMutation": "live-class",
  "contactUsMutation": "misc",
  "updateProfileMutation": "user",
  "deleteProfileMutation": "user",
  "addProgramStudentMutation": "program",
  "applyRefCodeMutation": "user",
  "createSchoolMutation": "user",
  "updateUserMutation": "user",
  "updateWAOptinMutation": "user",
  "syncUserContactListMutation": "misc",
  "updatePopupStatusMutation": "misc",
  "createOrUpdateAppRatingMutation": "misc",
  "newMessageReceivedSubscription": "chat",
  "newLiveEmojiSubscription": "live-class",
  "videoStreamUpdatedSubscription": "live-class",
  "classParticipantUpdatedSubscription": "live-class",
  "enrollmentCountUpdatedSubscription": "program",
  "v2ListCertificatesQuery": "program",
  "getRecentlyAttendedClassesQuery": "program",
  "getMyPostsQuery": "post",
  "getFeedsQuery": "post",
  "getPostQuery": "post",
  "getExperimentsQuery": "misc",
  "v1getExplorePageDataQuery": "program",
  "v2getHomePageDataQuery": "program",
  "v1getHomePageBannerQuery": "program",
  "getClassListQuery": "program",
  "chatMessagesQuery": "chat",
  "getClassParticipantsQuery": "live-class",
  "getBadgesQuery": "live-class",
  "getClassParticipantsCountandVideoTimeQuery": "live-class",
  "getClassQuery": "live-class",
  "getPollsQuery": "live-class",
  "getUserPollResultQuery": "live-class",
  "getClassReportQuery": "live-class",
  "mentorListingQuery": "program",
  "getMentorDetailsQuery": "program",
  "getFaqsQuery": "program",
  "getGeoLocationDataQuery": "user",
  "getPlacesSuggestionsQuery": "user",
  "getProfilesQuery": "user",
  "getSkillsQuery": "user",
  "getProfilesWithEnrollmentStatusQuery": "program",
  "getProgramDetailsQuery": "program",
  "getClassesQuery": "program",
  "getProgramListingQuery": "program",
  "progressReportSummaryAndHooksQuery": "program",
  "getReferralsQuery": "user",
  "calendarQuery": "program",
  "getSchoolsQuery": "user",
  "getSchoolQuery": "user",
  "getUserQuery": "user",
  "getUserWAOptinStatusQuery": "user",
  "getClassDetailsQuery": "live-class",
  "getContactsQuery": "misc",
  "getNextPopupQuery": "misc",
  "getMyRefCodeQuery": "user"
};

enum ClickToActionTypes {
  EXTERNAL_LINK,
  APP_LINK,
  PRODUCT_PAGE,
  WEBVIEW,
  DEFAULT,
  DISABLED,
  CLOSE,

  @Deprecated(
    'Use EXTERNAL_LINK instead. CAUTION: confirm with backend before changing',
  )
  ExternalLink,
  @Deprecated(
    'Use APP_LINK instead. CAUTION: confirm with backend before changing',
  )
  AppLink,
  @Deprecated(
    'Use PRODUCT_PAGE instead. CAUTION: confirm with backend before changing',
  )
  ProductPage,
}

extension CtaExt on ClickToActionTypes {
  String get toStr => this.toString().split(".").last;
}
