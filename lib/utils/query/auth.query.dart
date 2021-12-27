import 'package:yc_app/utils/query/profile_details_fragment.dart';
import 'package:yc_app/utils/query/user_details_fragment.dart';

class AuthQuery {
  String createAnonymousUser = """
    ${userPrimaryDetailsFragment.userPrimaryDetailsFragment}
    ${profileDetailsFragment.profileDetailsFragment}
    mutation createAnonymousUser{
      createAnonymousUser{
        userId
        profileId
        MYExpBucket
        user {
          ...UserPrimaryDetailsFragment
        }
        profile {
          ...ProfileDetailsFragment
        }
      }
    }
  """;
}

final AuthQuery authQuery = AuthQuery();
