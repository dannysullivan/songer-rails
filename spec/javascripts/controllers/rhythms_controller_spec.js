(function(){
  'use strict';

  describe('Controller: RhythmsCtrl', function () {
    beforeEach(module('songer'));

    var vm;
    beforeEach(inject(function ($controller) {
      vm = $controller("RhythmsCtrl");
    }));

    describe('#createRhythm', function() {
      it('randomly generates a new rhythm', function() {
        expect(vm.rhythms.length).toEqual(0);
        vm.createRhythm();
        vm.createRhythm();
        expect(vm.rhythms.length).toEqual(2);
        expect(vm.rhythms[0] == vm.rhythms[1]).toBeFalsy();
      });
    });
  });
})();
