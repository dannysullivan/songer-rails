angular.module('songer', [ 'templates', 'ngResource', 'ngRoute' ])
.config ['$routeProvider',
  ($routeProvider) ->
    $routeProvider.
      when('/posts', {
        templateUrl: 'posts/index.html',
        controller: 'PostsCtrl'
      }).
      when('/posts/new', {
        templateUrl: 'posts/new.html',
        controller: 'PostsCtrl'
      }).
      otherwise({
        redirectTo: '/posts'
      })
  ]
