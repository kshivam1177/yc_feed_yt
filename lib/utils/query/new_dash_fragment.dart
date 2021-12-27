class NewDashFragment {
  String newDashFragment = """
    fragment NewDashFragment on HomePageSection {
      headerKey
      headerTitle
      cards {
        attendanceInfo
        id
        title
        href
        isReminderSet
        ageRange {
          min
          max
        }
        isClassLive
        viewerCount
        isClassNew
        timestamp
        coverPicture {
          id
          url
        }
        coverPicture2By1 {
          id
          url
        }
        coverPicture3By2 {
          id
          url
        }
        classNum
        dateTime
        mentorName
        mentorGender
        programId
        programType
        programTypeTagText
        programTypeTagBgColor
        programTypeTagTextColor
        programEnrollmentStartTime
        programStartDate
        programContinuityType
        shouldShowEnrollmentPopup
        numClasses
        topRightLabelText
        topRightLabelBgColor
        topRightLabelTextColor
        canEnrollInBatch
        color
        classTypeTagText
      }
      entityType
      bgColor
      txtColor
      description
      title
      ctaType
      iconURL
      ctaUrl
    }
  """;
}

final NewDashFragment getNewDashFragment = NewDashFragment();
