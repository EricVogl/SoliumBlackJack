Card = require './card'
Suit = require './suit'

class Deck
  cards: null
  discardPile: null
  suits: [Suit.SPADES, Suit.CLUBS, Suit.HEARTS, Suit.DIAMONDS]
  ranks: ['A',2,3,4,5,6,7,8,9,10,'J','Q','K']

  constructor: ->
    @cards = []
    @discardPile = []
    for suit in @suits
      for rank in @ranks
        card = new Card(suit, rank)
        @cards.push card

  nextCard: ->
    @cards.pop()

  discard: (card) ->
    @discardPile.push card

  addDiscardBackToDeck: ->
    @cards.push @discardPile.pop() until @discardPile.length is 0

  shuffle: ->
    @cards.sort -> 0.5 - Math.random()

  toString: ->
    s = ''
    for card in @cards
      s += card.toString()
    s

module.exports = Deck
