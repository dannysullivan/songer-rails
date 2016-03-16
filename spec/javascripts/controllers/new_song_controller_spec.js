(function(){
  'use strict';

  describe('Controller: NewSongCtrl', function () {
    beforeEach(module('songer'));

    var vm;
    beforeEach(inject(function ($controller) {
      vm = $controller("NewSongCtrl");
    }));

    describe('#createArrangement', function() {
      it('randomly generates a new arrangement made of the given rhythms', function() {
        vm.rhythm1 = "x..x..x.";
        vm.rhythm2 = "x.x.x.x.";
        vm.createArrangement(8);
        expect(vm.arrangement.length).toEqual(8);
        for(var measure of vm.arrangement) {
          expect(measure == "x..x..x." || measure == "x.x.x.x.").toBeTruthy();
        }
      });
    });

    describe('#createRhythms', function() {
      it('randomly generates a new rhythm', function() {
        expect(vm.rhythm1).toBeUndefined();
        expect(vm.rhythm2).toBeUndefined();
        vm.createRhythms();

        expect(vm.rhythm1).toBeDefined();
        expect(vm.rhythm2).toBeDefined();
      });
    });
  });
})();
