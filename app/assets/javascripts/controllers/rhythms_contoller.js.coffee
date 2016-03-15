angular.module('songer').controller 'RhythmsCtrl', ->
  randomRhythm = ->
    values = ['x', '.']

    rhythm = ""
    for i in [0..7]
      index = Math.floor(Math.random()*2)
      rhythm = rhythm + values[index]
    rhythm

  controller = @

  controller.rhythms = []
  controller.createRhythm = ->
    rhythm = randomRhythm()
    while rhythm in controller.rhythms
      rhythm = randomRhythm()
    controller.rhythms.push rhythm 

  controller.playingBack = true

  controller.startMidiPlayback = (rhythm) ->
    onSuccess = ->
      note = 50
      velocity = 127
      MIDI.setVolume(0, 127)

      delay = 0
      for i in [0..rhythm.length]
        if rhythm[i] == 'x'
          MIDI.noteOn(0, note, velocity, delay)
          MIDI.noteOff(0, note, delay + 0.45)
        delay += 0.5

    MIDI.loadPlugin
      soundfontUrl: "./soundfonts/",
      instrument: "acoustic_grand_piano",
      onprogress:((state, progress) ->
        console.log(state, progress)
      ),
      onsuccess: onSuccess

  controller
