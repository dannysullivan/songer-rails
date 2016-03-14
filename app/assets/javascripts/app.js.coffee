angular.module('songer', [ 'templates', 'ngRoute' ])
.config ['$routeProvider',
  ($routeProvider) ->
    $routeProvider.
      when('/rhythms', {
        templateUrl: 'rhythms/index.html',
        controller: 'RhythmsCtrl'
      }).
      otherwise({
        redirectTo: '/rhythms'
      })
  ]
