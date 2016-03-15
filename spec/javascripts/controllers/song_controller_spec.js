(function(){
  'use strict';

  describe('Controller: SongCtrl', function () {
    beforeEach(module('songer'));

    var vm;
    beforeEach(inject(function ($controller) {
      vm = $controller("SongCtrl");
    }));

    describe('#createArrangement', function() {
      it('randomly generates a new arrangment made of the given rhythms', function() {
        vm.rhythm1 = "x..x..x.";
        vm.rhythm2 = "x.x.x.x.";
        vm.createArrangement(8);
        expect(vm.arrangement.length).toEqual(8);
        for(var measure of vm.arrangement) {
          expect(measure == "x..x..x." || measure == "x.x.x.x.").toBeTruthy();
        }
      });
    });
  });
})();
