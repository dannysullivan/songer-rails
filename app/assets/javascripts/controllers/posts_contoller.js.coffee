angular.module('flapperNews').controller 'PostsCtrl', [
  '$scope',
  'Post',
  ($scope, Post) ->
    $scope.posts = Post.query()
    $scope.newPost = new Post()
    $scope.incrementUpvotes = (post) ->
      post['upvotes']++

    $scope.createPost = () ->
      Post.save($scope.newPost)
]
