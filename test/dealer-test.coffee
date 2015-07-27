chai = require 'chai'
chai.should()
Card = require '../src/card'
Suit = require '../src/suit'
Dealer = require '../src/dealer'
Move = require '../src/move'
Hand = require '../src/hand'

describe 'Dealer instance', ->
  dealer = null
  it 'should start with an empty hand', ->
    dealer = new Dealer
    dealer.hand.shownCards.length.should.equal 0
    dealer.hand.hiddenCards.length.should.equal 0
  it 'should hit when hand value is under 16', ->
    dealer = new Dealer
    dealer.hand.addShownCard new Card(Suit.CLUBS, '10')
    dealer.nextMove().should.equal Move.HIT
  it 'should hit when hand value is 16', ->
    dealer = new Dealer
    dealer.hand.addShownCard new Card(Suit.CLUBS, '10')
    dealer.hand.addShownCard new Card(Suit.CLUBS, '6')
    dealer.nextMove().should.equal Move.HIT
  it 'should stay when hand value is over 16', ->
    dealer = new Dealer
    dealer.hand.addShownCard new Card(Suit.CLUBS, 'K')
    dealer.hand.addShownCard new Card(Suit.CLUBS, '7')
    dealer.nextMove().should.equal Move.STAND
