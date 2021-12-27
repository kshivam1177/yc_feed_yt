class ProfileDetailsFragment {
  String get profileDetailsFragment => '''
    fragment ProfileDetailsFragment on Profile {
      id
      fullName
      onboardingStatus
      onboardingStep
      dob
      gender
      parentId
      currentSchool
      preferredSkills {
        id
      }
      agePreference{
        min
        max
      }
      profilePic {
        url
      }
      status
    }
  ''';
}

final ProfileDetailsFragment profileDetailsFragment = ProfileDetailsFragment();
