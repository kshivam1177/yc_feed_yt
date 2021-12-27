import 'package:yc_app/utils/query/new_dash_fragment.dart';

class HomePageQuery {
  String preLoginHomePageQuery = """
    query getHomePageData {
    getContentAnalytics {
      learnersPerSec
      baseLearners
      minutesPerSec
      baseMinutes
      dateTime
    }
    getFeaturedMentors {
      id
      fullName
      tagline
      upvotesCount
      isFeatured
      skillDetails {
        id
        title
        color
      }
      profilePic {
        id
        url
      }
      mobileCoverPic {
        id
        url
      }
      slug
    }
    getCategories (params: {calledFrom:HOMEPAGE}) {
      id
      title
      displayTitle
      programs {
        id
        title
        slug
        upvotesCount
        tagline
        membershipType
        href
        ageRange {
          min
          max
        }
        coverPicture {
          id
          url
        }
        mobileCoverPic {
          id
          url
        }
        skillDetails {
          id
          title
          color
        }
        mentorDetails {
          id
          fullName
        }
        isFeatured
        isHot
      }
      image {
        url
      }
      color
    }
    getLandingPageHooks {
      key
      title
      titleTextColor
      sections {
        key
        title
        titleTextColor
        description
        bgColor
        ctaType
        ctaUrl
        entityType
        iconUrl
        descriptionTextColor
      }
      bgColor
    }
    v1getLandingPageClassesWithBanner {
      bannerDetails {
        title
        subtitle
        ctaText
        ctaUrl
        backgroundImageWebUrl
        backgroundImageMobileUrl
        backgroundColor
      }
      cards {
      id
      classNum
      title
      programContinuityType
      programType
      programTypeTagText
      programTypeTagBgColor
      programTypeTagTextColor
      dateTime
      duration
      isClassLive
      href
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
      mentorName
      mentorGender
      attendanceInfo
      color
      classTypeTagText
      programId
    }
    }
  }
  """;

  String v2getHomePageData = """
  query v2getHomePageDataQuery {
    v2getHomePageData {
      rows {
        ...NewDashFragment
      }
    }
  }
  ${getNewDashFragment.newDashFragment}
  """;

  String v2getHomePageDataWithBellStatus = """
  query v2getHomePageDataQuery{
    v2getHomePageData {
      rows {
        ...NewDashFragment
      }
    }
    getNotificationsBellStatus{
      status
    }
  }
  ${getNewDashFragment.newDashFragment}
  """;

  String v1getHomePageBanner = """
  query v1getHomePageBannerQuery {
    v1getHomePageBanner{
      bannerImageWebUrl
      bannerTitle
      clickActionType
      clickActionUrl
      clickActionEntityType
      clickActionEntityID
    }
  }
  """;

  String getViewerCount = """
  query getViewerCountQuery(\$ids: [ID!]!) {
    getViewerCount(params: { ids: \$ids }) {
      id
      viewerCount
    }
  }
  """;

  String getClassList = """
  query getClassListQuery(\$classType: ClassTypeEnum,\$titleKey: ClassListTitleKeyEnum,\$programType: ProgramTypeEnum) {
  getClassList(params: { classType: \$classType,titleKey:\$titleKey,programType:\$programType }) {
      count
      classes {
        ageRange {
          min
          max
        }
        title
        dateTime
        mentorFullName
        mentorGender
        percentageWatched
        duration
        attendanceCount
        programTitle
        classNum
        programContinuityType
        minutes
        coverPicture {
          url
        }
        coverPicture2By1 {
          url
        }
        coverPicture3By2 {
          url
        }
        classType
        classTypeColor
      }
      title
      shouldShowProgress
      shouldShowNumClasses
    }
  }
  """;

  String dashboardQuery = """
    query v1getDashboardPageData {
      v1getDashboardPageData {
        greetingText
        profilePic {
          url
        }
        profileName
        sections {
          sectionTitle
          sectionType
          sectionKey
          sectionScrollDirection
          sectionTitleColor
          cardDisplayStyle
          sectionDelimiter {
            delimiterColor
            allowDelimiter
          }
          cardDisplaySubStyle
          sectionBackground {
            backgroundType
            backgroundColor
            gradientColor1
            gradientColor2
            gradientDirection
            shouldLeaveBorder
          }
          sectionClickAction{
            clickActionType
            clickActionUrl
          }
          sectionExpansion {
            sectionExpansionText
            sectionExpansionTextCTA {
              clickActionUrl
              clickActionType
            }
            sectionExpansionTextColor
          }
          cards {
            entityType
            entityId
            classNum
            cardBackground {
              backgroundType
              backgroundColor
              backgroundImageUrl
              aspectRatio
            }
            cardClickAction {
              clickActionUrl
              clickActionType
            }
            entityTitle
            mentorName
            mentorGender
            ageRange {
              min
              max
            }
            completionPercentage
            progressBar
            isClassLive
            isFeatured
            programId
            classNum
            dateTime
            duration
            viewerCount
            attendanceCount
            classType
            classTypeColor
            programType
            programTitle
            programContinuityType
            programStartDate
            isUpcoming
            isUpcomingColor
            programEnrollmentStartTime
            programEnrollmentEndTime
            numClasses
            numAttendedClasses
          }
          sectionImageUrl
          sectionIconUrl
          sectionDescription
          sectionStaticButton {
            buttonText
            buttonColor
            buttonCTA {
              clickActionType
              clickActionUrl
            }
          }
        }
      }
    }
""";

  final String ageRange = """
  query {
    v1GetAvailableAgeRanges {
     label
      values{
        min
        max
      }
    }
  }
  """;
  final String contentDashboard = """
     query v1GetMYPageData(
      \$page: Int
      \$recommendedClassesListingId: String
      \$anonymousUserId: String
      \$anonymousProfileId: String
      \$userAgePreference: MinMaxInput
    ) {
      v1GetMYPageData(
        params: {
          page: \$page
          recommendedClassesListingId: \$recommendedClassesListingId
          anonymousUserId: \$anonymousUserId
          anonymousProfileId: \$anonymousProfileId
          userAgePreference: \$userAgePreference
        }
      ) {
        sections {
          sectionType
          hookDetails {
            clickActionType
            clickActionUrl
            buttonText
            buttonTextColor
            backgroundImgUrl
            description
            backgroundColor
            hookType
            descriptionColor
          }
          trustMarkersSection {
            key
            label
            iconURL
            bgColor
          }
          banners {
            rank
            entityType
            entityId
            classNum
            cardBackground {
              backgroundImageUrl
              aspectRatio
            }
            cardClickAction {
              clickActionUrl
              clickActionType
            }
            entityTitle
            mentorName
            mentorGender
            ageRange {
              min
              max
            }
            completionPercentage
            progressBar
            isClassLive
            isFeatured
            programId
            classNum
            dateTime
            duration
            viewerCount
            attendanceCount
            classType
            classTypeColor
            programType
            programTitle
            programContinuityType
            programStartDate
            isUpcoming
            isUpcomingColor
            programEnrollmentStartTime
            programEnrollmentEndTime
            numClasses
            numAttendedClasses
          }
          reviewSection {
            rating
            reviewsCount
            enrollmentCount
            reviews {
              reviewerName
              profilePic
              review
            }
          }
          skillsSection {
            id
            title
            displayTitle
            programs {
              id
              title
              slug
              upvotesCount
              tagline
              membershipType
              href
              ageRange {
                min
                max
              }
              coverPicture {
                id
                url
              }
              mobileCoverPic {
                id
                url
              }
              skillDetails {
                id
                title
                color
              }
              mentorDetails {
                id
                fullName
              }
              isFeatured
              isHot
            }
            image {
              url
            }
            color
          }
          heroSection {
            headingText
            headingTextColor
            subHeadingText
            subHeadingTextColor
          }
          upcomingClasses {
            entityType
            entityId
            classNum
            cardBackground {
              backgroundType
              backgroundColor
              backgroundImageUrl
              aspectRatio
            }
            cardClickAction {
              clickActionUrl
              clickActionType
            }
            entityTitle
            mentorName
            mentorGender
            ageRange {
              min
              max
            }
            completionPercentage
            progressBar
            isClassLive
            isFeatured
            programId
            classNum
            dateTime
            duration
            viewerCount
            attendanceCount
            classType
            classTypeColor
            programType
            programTitle
            programContinuityType
            programStartDate
            isUpcoming
            isUpcomingColor
            programEnrollmentStartTime
            programEnrollmentEndTime
            numClasses
            numAttendedClasses
          }
          competitionClasses {
            entityType
            entityId
            classNum
            cardBackground {
              backgroundType
              backgroundColor
              backgroundImageUrl
              aspectRatio
            }
            cardClickAction {
              clickActionUrl
              clickActionType
            }
            entityTitle
            mentorName
            mentorGender
            ageRange {
              min
              max
            }
            completionPercentage
            progressBar
            isClassLive
            isFeatured
            programId
            classNum
            dateTime
            duration
            viewerCount
            attendanceCount
            classType
            classTypeColor
            programType
            programTitle
            programContinuityType
            programStartDate
            isUpcoming
            isUpcomingColor
            programEnrollmentStartTime
            programEnrollmentEndTime
            numClasses
            numAttendedClasses
          }
          classes{
            rank
            score
            entityType
            entityId
            classNum
            cardBackground {
              backgroundImageUrl
              aspectRatio
            }
            cardClickAction {
              clickActionUrl
              clickActionType
            }
            entityTitle
            mentorName
            mentorGender
            ageRange {
              min
              max
            }
            completionPercentage
            progressBar
            isClassLive
            isFeatured
            programId
            classNum
            dateTime
            duration
            viewerCount
            attendanceCount
            classType
            classTypeColor
            programType
            programTitle
            programContinuityType
            programStartDate
            isUpcoming
            isUpcomingColor
            programEnrollmentStartTime
            programEnrollmentEndTime
            numClasses
            numAttendedClasses
          }
        }
        recommendedClassesListingId
      }
    }

  """;

  String contentDashboardClickQuery = """
  query v1HandleRecommendedClassListingClicks(
      \$clickInput:V1HandleRecommendedClassListingClicksInput
    ) {
      v1HandleRecommendedClassListingClicks(
        params: \$clickInput

      ) {
        msg
        status
      }
    }
  """;
}

HomePageQuery homePageQuery = HomePageQuery();
