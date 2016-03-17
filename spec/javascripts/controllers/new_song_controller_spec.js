(function(){
  'use strict';

  describe('Controller: NewSongCtrl', function () {
    beforeEach(module('songer'));

    var vm;
    beforeEach(inject(function ($controller) {
      vm = $controller("NewSongCtrl");
    }));

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
