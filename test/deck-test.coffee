chai = require 'chai'
chai.should()
Deck = require '../src/deck'

describe 'Deck instance', ->
  deck = null
  it 'should have 52 cards', ->
    deck = new Deck
    deck.nextCard() for [1..52]
    deck.cards.should.be.empty
  it 'should contain 13 cards of 4 suits', ->
    deck = new Deck
    map = {}
    mapFunc = (card) ->
      if map[card.suit] is undefined
        map[card.suit] = []
      map[card.suit].push card.rank
    mapFunc(card) for card in deck.cards
    Object.keys(map).length.should.equal 4
    for key, value of map
      value.length.should.equal 13
  it 'should contain unique values', ->
    deck = new Deck
    checkIt = ->
      card = deck.nextCard()
      deck.cards.should.not.contain card
    checkIt for [1..52]
