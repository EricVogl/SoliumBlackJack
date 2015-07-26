Suit = require './suit'

class Card
  suit: new Suit('', '')
  rank: ''

  constructor: (s, r) ->
    @suit = s
    @rank = r

  value: ->
    if @rank is 'A' then 11
    else if @rank > 'A' then 10
    else parseInt(@rank, 10)

  toString: ->
    "#{@rank}#{@suit.symbol}"

module.exports = Card
