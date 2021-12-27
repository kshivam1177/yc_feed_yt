class PostQuery {
  String likePost = """
     mutation likePostMutation(\$postId: String!){
        likePost(params:{postId: \$postId}){
            status
            msg
        }
     }
 """;

  String listOfLikes = """
   query getLikesOnPost(\$postId: ID!, \$lastLikeId: ID, \$limit: Int) {
     getLikesOnPost(
       params: { postId: \$postId, lastLikeId: \$lastLikeId, limit: \$limit }
     ) {
       likedBy {
         fullName
         profilePic {
           url
         }
       }
       lastLikeId
       totalLikesOnPost
     }
   }
  """;

  String reportPost = """
     mutation reportPostMutation(\$postId: String!){
        reportPost(params:{postId: \$postId}){
            status
            msg
        }
     }
 """;

  String deletePost = """
       mutation deletePostMutation(\$postId: String!){
        deletePost(params:{postId: \$postId}){
            status
            msg
        }
     }
 """;

  String createPost = """
    mutation createPostMutation(\$postInput: PostInput!) {
      createPost(params: \$postInput) {
        id
        caption
        status
        postType
        class {
          classNum
          batchId
        }
      }
    }
  """;

  String getRecentlyAttendedClasses = """
    query getRecentlyAttendedClassesQuery(
      \$profileIds: [String]!
    ){
    getRecentlyAttendedClasses(
       params: {
          profileIds: \$profileIds
       }
    ){
        id
        title
        mentorDetails{
          fullName
        }
       dateTime
    }
    }
  """;

  String getMyPosts = """
   query getMyPostsQuery(\$skip:Int, \$limit: Int){
    getMyPosts(params:{skip:\$skip, limit:\$limit}){
      entity{
      id
      title
      type
      ctaText
      }
      id
      caption
      status
      postType
      blogContent
      likesCount
      adLink
      user{
        id
        fullName
        profilePic{
          id
          url
        }
        isUserAChild
        relationship
      }
      profiles{
        id
        fullName
        profilePic{
          id
          url
        }
      }
      createdAt
      media{
        mediaType
        order
        caption
        url
        thumbnail
        format
      }
      class{
        id
        classNum
        title
        batchId
        coverPicture{
          url
        }
      }
      isLiked
      feedbackDate
      feedbackText
      feedbackBy{
        fullName
        profilePic
        gender
      }
    }
  }
  """;

  String getFeeds = """
   query getFeedsQuery(\$page:Int, \$specialPostIds:[String]){
    getFeeds(params:{page:\$page, specialPostIds:\$specialPostIds}){
      entity{
      id
      title
      type
      ctaText
      }
      id
      caption
      status
      postType
      hookImageUrl
      clickAction {
        clickActionType
        clickActionUrl
      }
      blogContent
      likesCount
      adLink
      user{
        id
        fullName
        profilePic{
          id
          url
        }
        isUserAChild
        relationship
      }
      profiles{
        id
        fullName
        profilePic{
          id
          url
        }
      }
      createdAt
      media{
        mediaType
        order
        caption
        url
        thumbnail
        format
      }
      class{
        title
        classNum
        coverPicture{
          url
        }
        videoDetails{
          videoUrl
        }
        mentorDetails{
          fullName
          gender
        }
        programDetails{
          id
          title
        }
        dateTime
        duration
        description
      }
      isLiked
      feedbackDate
      feedbackText
      feedbackBy{
        fullName
        profilePic
        gender
      }
    }
  }
  """;

  String getPost = """
  query getPostQuery(\$id: String!) {
      getPost(params: { id: \$id }) {
      entity{
      id
      title
      type
      ctaText
      }
      id
      caption
      status
      postType
      blogContent
      likesCount
      adLink
      user{
        id
        fullName
        profilePic{
          id
          url
        }
        isUserAChild
        relationship
      }
      profiles{
        id
        fullName
        profilePic{
          id
          url
        }
      }
      createdAt
      media{
        mediaType
        order
        caption
        url
        thumbnail
        format
      }
      class{
        title
        classNum
        coverPicture{
          url
        }
        videoDetails{
          videoUrl
        }
        mentorDetails{
          fullName
          gender
        }
        programDetails{
          id
          title
        }
        dateTime
        duration
        description
      }
      isLiked
      feedbackDate
      feedbackText
      feedbackBy{
        fullName
        profilePic
        gender
      }
      }
    }
    """;

  String recordPostTime = """
  mutation recordPostTimeSpent(\$postTimeSpentInput: RecordPostTimeSpentInput!) {
      recordPostTimeSpent(params: \$postTimeSpentInput) {
        msg
        status
      }
    }
    """;
}

final PostQuery postQuery = PostQuery();
