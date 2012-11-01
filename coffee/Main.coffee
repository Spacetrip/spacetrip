require.define 'spacetrip/main': (require, exports, module) ->
    gamejs = require 'gamejs'
    display = require 'gamejs/display'
    image = require 'gamejs/image'
    time = require 'gamejs/time'
    event = require 'gamejs/event'

    Spacecraft = require('spacetrip/spacecraft').Spacecraft
    Controls = require('spacetrip/controls').Controls

    main = ->
        console.log 'Loading ...'

        display.setMode [800, 600]

        surface = display.getSurface()
        surface.blit image.load 'assets/images/background.png'

        player = new Spacecraft surface.getSize()[0] / 2, surface.getSize()[1] / 2

        controls = new Controls

        tick = (msDuration) ->
            event.get().forEach(controls.handle)

            if controls.up
                console.log 'Up ...'
            else if controls.down
                console.log 'Down ...'
            else if controls.right
                console.log 'Right ...'
            else if controls.left
                console.log 'Left ...'
            else if controls.fire
                console.log 'Firing ...'

            player.update msDuration
            player.draw surface

        time.fpsCallback tick, this, 25

    gamejs.preload [
        'assets/images/background.png',
        'assets/images/spacecraft.png'
    ]

    gamejs.ready main
