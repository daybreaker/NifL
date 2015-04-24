# app/assets/javascripts/main.js.coffee

# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
@nifl = angular.module('nifl', ['ngRoute', "ui.bootstrap"])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.

@nifl.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when("/", {
      templateUrl: '/templates/users/index.html',
      controller: 'UsersIndexController'
    }).
    when('/seasons/:id', {
      templateUrl: '/templates/seasons/show.html',
      controller: 'SeasonsShowController'
    }).
    when('/weeks/:id', {
      templateUrl: '/templates/weeks/show.html',
      controller: 'WeeksShowController'
    })
    .when('/users/sign_in', {templateUrl:'/users/login.html', controller:"UsersLoginController"})
    .when('/users/register', {templateUrl:'/users/register.html', controller:"UsersRegisterController"})
    .otherwise({
      templateUrl: '/templates/users/index.html',
      controller: 'UsersIndexController'
    })
])

$ ->
  $(document).on 'ajax:success', 'form', (event, data, status, xhr)->
    target = $(this).data('update-target')
    console.log target
    $('#' + target).replaceWith(data)

    return

  $(document).on 'click', '.make-pick', (e)->
    e.preventDefault()
    console.log "WHAT"
    form = $(this).parent("form")
    form.submit()
    return
  return
  
