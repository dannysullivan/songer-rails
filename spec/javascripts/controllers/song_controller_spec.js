(function(){
  'use strict';

  describe('Controller: SongCtrl', function () {
    beforeEach(module('songer'));

    var vm;
    beforeEach(inject(function ($controller) {
      vm = $controller("SongCtrl");
    }));

    describe('#createPattern', function() {
      it('randomly generates a new pattern made of the given rhythms', function() {
        vm.createPattern(8, "x..x..x.", "x.x.x.x.");
        expect(vm.measures.length).toEqual(8);
        expect(vm.pattern.length).toEqual(64);
        for(var measure of vm.measures) {
          expect(measure == "x..x..x." || measure == "x.x.x.x.").toBeTruthy();
        }
      });
    });
  });
})();
