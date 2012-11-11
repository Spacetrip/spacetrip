require.define 'spacetrip/space': (require, exports, module) ->
    gamejs = require 'gamejs'
    sprite = require 'gamejs/sprite'
    image = require 'gamejs/image'

    class Space extends sprite.Sprite
        constructor: (options) ->
            @image = image.load 'assets/images/background.png'
            @rect = new gamejs.Rect 0, 0

    exports.Space = Space
