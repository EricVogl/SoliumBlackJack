Suit = require './suit'

class Card
  suit: null
  rank: null

  constructor: (s, r) ->
    @suit = s
    @rank = r

  value: ->
    if @rank is 'A' then 11
    else if @rank > 'A' then 10
    else parseInt(@rank, 10)

  toString: ->
    "#{@rank}#{@suit}"

module.exports = Card
