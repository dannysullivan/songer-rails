angular.module('songer').controller 'SongCtrl', ->
  controller = @

  controller.startPlayback = (midiUrl) ->
    MIDI.loadPlugin
      soundfontUrl: "../soundfonts/",
      instrument: "acoustic_grand_piano",
      onprogress:((state, progress) ->
        console.log(state, progress)
      ),
      onsuccess: ->
        player = MIDI.Player
        player.loadFile midiUrl, MIDI.Player.start
  controller
