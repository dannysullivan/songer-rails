angular.module('songer').controller 'SongCtrl', ->
  controller = @

  controller.createArrangement = (numberOfMeasures) ->
    rhythms = [controller.rhythm1, controller.rhythm2]
    controller.arrangement = []

    for i in [0...numberOfMeasures]
      index = Math.floor(Math.random()*rhythms.length)
      controller.arrangement.push(rhythms[index])

  controller.playNote = ->
    MIDI.loadPlugin
      soundfontUrl: "./soundfonts/",
      instrument: "acoustic_grand_piano",
      onprogress:((state, progress) ->
        console.log(state, progress)
      ),
      onsuccess: ->
        delay = 0
        note = 50
        velocity = 127
        MIDI.setVolume(0, 127)
        MIDI.noteOn(0, note, velocity, delay)
        MIDI.noteOff(0, note, delay + 0.75)

  controller
