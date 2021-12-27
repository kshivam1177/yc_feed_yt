class UserPrimaryDetailsFragment {
  String userPrimaryDetailsFragment = """
    fragment UserPrimaryDetailsFragment on User {
      id
      fullName
      gender
      premiumValidTill
      hasAttendedClass
      hasRedeemedRefCode
      profilePic {
        id
        url
      }
      onboardingStatus
      mobile
      profiles {
        id
        fullName
        dob
        gender
        parentId
      }
      age
      status
      photos {
        id
        url
      }
      role
    }
  """;
}

final UserPrimaryDetailsFragment userPrimaryDetailsFragment =
    UserPrimaryDetailsFragment();
