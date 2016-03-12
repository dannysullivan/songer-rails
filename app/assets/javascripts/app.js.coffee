angular.module('flapperNews', [ 'ngResource', 'ngRoute' ])
.config ['$routeProvider',
  ($routeProvider) ->
    $routeProvider.
      when('/posts', {
        templateUrl: 'assets/posts/index.html',
        controller: 'PostsCtrl'
      }).
      when('/posts/new', {
        templateUrl: 'assets/posts/new.html',
        controller: 'PostsCtrl'
      }).
      otherwise({
        redirectTo: '/posts'
      })
  ]
