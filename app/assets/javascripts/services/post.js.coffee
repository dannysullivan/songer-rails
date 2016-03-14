angular.module('songer').factory('Post', ['$resource', ($resource) ->
  $resource '/api/posts/:id'
])
