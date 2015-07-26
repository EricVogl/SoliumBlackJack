Card = require './card'

class Deck
  cards: []
  suits: ['\u2660', '\u2663', '\u2665', '\u2666']
  ranks: ['A',2,3,4,5,6,7,8,9,10,'J','Q','K']

  constructor: ->
    for suit in @suits
      for rank in @ranks
        card = new Card(suit, rank)
        @cards.push card

  nextCard: ->
    @cards.pop()

  shuffle: ->
    @cards.sort -> 0.5 - Math.random()

  toString: ->
    s = ''
    for card in @cards
      s += card.toString()
    s

module.exports = Deck
