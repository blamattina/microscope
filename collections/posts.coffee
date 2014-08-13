@Posts = new Meteor.Collection 'posts'

Meteor.methods

  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = Posts.findOne url: postAttributes.url

    if not user
      throw new Meteor.Error 401, 'You need to login to post new stories'

    if not postAttributes.title
      throw new Meteor.Error 422, 'Please fill in a headline'

    if postAttributes.url and postWithSameLink
      throw new Meteor.Error(
        302, 'This link has already been posted', postWithSameLink._id
      )

    post = _.extend(_(postAttributes).pick('url', 'title', 'message'),
       userId: user._id
       author: user.username
       submitted: new Date().getTime()
    )

    Posts.insert post
