chai = require 'chai'
chai.should()
Card = require '../src/card'
Suit = require '../src/suit'

describe 'Card instance', ->
  card = null
  suit = new Suit('Spades', '\u2660')
  it 'should have a suit', ->
    card = new Card(suit,'A')
    card.suit.name.should.equal 'Spades'
    card.suit.symbol.should.equal '\u2660'
  it 'should have a rank', ->
    card = new Card(suit,'A')
    card.rank.should.equal 'A'
  it 'should have a pretty print string value', ->
    card = new Card(suit,'2')
    card.toString().should.equal '2\u2660'
  it 'should have a value of 11 for Ace', ->
    card = new Card(suit,'A')
    card.value().should.equal 11
  for n in [2..10]
    it "should have a value of #{n} for #{n}", ->
      card = new Card(suit,n)
      card.value().should.equal n
  for f in ['J','Q','K']
    it "should have a value of 10 for #{f}", ->
      card = new Card(suit,f)
      card.value().should.equal 10
