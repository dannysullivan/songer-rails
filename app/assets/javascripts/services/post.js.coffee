angular.module('flapperNews').factory('Post', ['$resource', ($resource) ->
  $resource '/api/posts/:id'
])
