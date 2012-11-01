require.define 'spacetrip': (require, exports, module) ->
    gamejs = require 'gamejs'
    sprite = require 'gamejs/sprite'
    image = require 'gamejs/image'

    class Spacecraft extends sprite.Sprite
        constructor: (x, y) ->
            super
            @speed = 0
            @image = image.load 'assets/images/spacecraft.png'
            @rect = new gamejs.Rect x - @image.getSize()[0] / 2, y

    exports.Spacecraft = Spacecraft
