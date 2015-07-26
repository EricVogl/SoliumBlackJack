Card = require './card'
Suit = require './suit'

class Deck
  cards: []
  suits: [new Suit('Spades', '\u2660'),
          new Suit('Clubs', '\u2663'),
          new Suit('Hearts', '\u2665'),
          new Suit('Diamonds', '\u2666')]
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
