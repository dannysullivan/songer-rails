angular.module('songer').controller 'SongCtrl', ['$scope', 
  ($scope) ->
    controller = @

    incrementIndex = ->
      $scope.wordIndex += 1
      $scope.$apply()

    $scope.wordIndex = -1

    controller.startPlayback = (midiUrl) ->
      MIDI.loadPlugin
        soundfontUrl: "../soundfonts/",
        instrument: "acoustic_grand_piano",
        onprogress:((state, progress) ->
          console.log(state, progress)
        ),
        onsuccess: ->
          player = MIDI.Player
          player.addListener (data) ->
            if data.message == 144
              if data.note > 50
                incrementIndex()
          player.loadFile midiUrl, player.start
    controller
]
