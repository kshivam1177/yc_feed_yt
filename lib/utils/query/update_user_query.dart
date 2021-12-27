class UpdateUserQuery {
  String updateUser = """
  mutation updateUserMutation(\$id:ID,\$fullName:String,\$onboardingStatus:Int,\$location:LocationInput,\$email:[String!],\$relationship:RelationshipEnum,\$isUserAChild:Boolean,\$defaultVideoQuality:String){
    updateUser(params:{id:\$id,fullName:\$fullName,onboardingStatus:\$onboardingStatus,location:\$location,email:\$email,relationship:\$relationship,isUserAChild:\$isUserAChild, defaultVideoQuality: \$defaultVideoQuality}){
      id
      fullName
      gender
      onboardingStatus
      email
      emailVerified
      relationship
      isUserAChild
      premiumValidTill
      hasRedeemedRefCode
      isUserCreatedAfterTracksRelease
      defaultVideoQuality
      profilePic {
        id
        url
      }
      mobile
      photos {
        id
        url
      }
      role
      location {
        address
        coordinates {
          lat
          lng
        }
        geoId
      }
      profiles {
        id
        fullName
        onboardingStatus
        onboardingStep
        dob
        gender
        parentId
        currentSchool
        pastSchools {
          id
        }
        preferredSkills {
          id
        }
        status
      }
    }
  }
  """;
}

final UpdateUserQuery updateUserQuery = UpdateUserQuery();
