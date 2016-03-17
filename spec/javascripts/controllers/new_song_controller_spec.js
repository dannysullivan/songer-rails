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
      it('randomly generates rhythms', function() {
        var originalRhythm1 = vm.rhythm1;
        var originalRhythm2 = vm.rhythm2;

        vm.createRhythms();

        expect(vm.rhythm1 != originalRhythm1).toBeTruthy();
        expect(vm.rhythm2 != originalRhythm2).toBeTruthy();
      });
    });
  });
})();
