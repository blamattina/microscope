Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe 'posts'

Router.map ->
  this.route 'postsList', path: '/'
  this.route 'postPage',
    path: '/posts/:_id'
    data: -> Posts.findOne @params._id
