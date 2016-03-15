angular.module('songer', [ 'templates', 'ngRoute' ])
.config ['$routeProvider',
  ($routeProvider) ->
    $routeProvider.
      when('/rhythms', {
        templateUrl: 'rhythms/index.html',
        controller: 'RhythmsCtrl'
      }).
      when('/songs/new', {
        templateUrl: 'songs/new.html',
        controller: 'SongCtrl'
      }).
      otherwise({
        redirectTo: '/rhythms'
      })
  ]
