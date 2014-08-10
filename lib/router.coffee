Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> return Meteor.subscribe 'posts'

Router.map ->
  this.route 'postsList', path: '/'
