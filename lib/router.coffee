Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe 'posts'

Router.map ->
  this.route 'postsList', path: '/'
  this.route 'postPage',
    path: '/posts/:_id'
    data: -> Posts.findOne @params._id
  this.route 'postSubmit', path: '/submit'

requireLogin = (pause) ->
  if not Meteor.user()
    this.render 'accessDenied'
    pause()

Router.onBeforeAction 'loading'
Router.onBeforeAction requireLogin, only: 'postSubmit'
