describe('Service: Post', function () {
  beforeEach(module('songer'));

  it('returns a JSON object with posts', inject(function ($httpBackend, Post) {
    $httpBackend.when('GET', '/api/posts').respond(["item 1", "item 2"]);

    var posts = Post.query()

    $httpBackend.expectGET('/api/posts');
    $httpBackend.flush();
    expect(posts.slice(0,2)).toEqual(["item 1", "item 2"]);
  }));
});
