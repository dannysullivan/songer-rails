(function(){
  'use strict';

  describe('Controller: PostsCtrl', function () {
    var scope, fakeItems;

    beforeEach(module('flapperNews', function($provide){
      fakeItems = [ { 'title': 'Test Title', 'upvotes': 0 }, { 'title': 'Test Title', 'upvotes': 2 } ];

      var fakePost = {
        query: function() {
          return fakeItems;
        }
      };

      $provide.value("Post", fakePost);
    }));

    beforeEach(inject(function ($controller, $rootScope) {
      scope = $rootScope.$new();
      $controller('PostsCtrl', { $scope: scope });
    }));

    it('populates the scope with the posts', function () {
      expect(scope.posts).toEqual(fakeItems);
    });

    describe('#incrementUpvotes', function () {
      it('increments upvotes for the supplied post', function() {
        var firstPost = scope.posts[0]
        expect(firstPost['upvotes']).toEqual(0)
        scope.incrementUpvotes(firstPost)
        expect(firstPost['upvotes']).toEqual(1)
      });
    });
  });
})();
