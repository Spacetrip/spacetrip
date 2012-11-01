require.define 'spacetrip/spacecraft': (require, exports, module) ->
    gamejs = require 'gamejs'
    sprite = require 'gamejs/sprite'
    image = require 'gamejs/image'

    class Spacecraft extends sprite.Sprite
        constructor: (x, y) ->
            super
            @angle = null
            @speed = 200
            @image = image.load 'assets/images/spacecraft.png'
            @rect = new gamejs.Rect x - @image.getSize()[0] / 2, y

        update: (msDuration) ->
            if @angle
                @rect.moveIp [
                    Math.cos(@angle) * @speed * (msDuration / 1000),
                    Math.sin(@angle) * @speed * (msDuration / 1000)
                ]

    exports.Spacecraft = Spacecraft
