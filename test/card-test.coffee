chai = require 'chai'
chai.should()
Card = require '../src/card'
Suit = require '../src/suit'

describe 'Card instance', ->
  card = null
  suit = Suit.SPADES
  it 'should have a suit', ->
    card = new Card(suit,'A')
    card.suit.should.equal Suit.SPADES
  it 'should have a rank', ->
    card = new Card(suit,'A')
    card.rank.should.equal 'A'
  it 'should have a pretty print string value', ->
    card = new Card(suit,'2')
    card.toString().should.equal "2#{Suit.SPADES}"
  it 'should have a value of 11 for Ace', ->
    card = new Card(suit,'A')
    card.value().should.equal 11
  it 'should have a low value of 1 for Ace', ->
    card = new Card(suit,'A')
    card.lowValue().should.equal 1
  for n in [2..10]
    it "should have a value of #{n} for #{n}", ->
      card = new Card(suit,n)
      card.value().should.equal n
    it "should have a low value of #{n} for #{n}", ->
      card = new Card(suit,n)
      card.lowValue().should.equal n
  for f in ['J','Q','K']
    it "should have a value of 10 for #{f}", ->
      card = new Card(suit,f)
      card.value().should.equal 10
    it "should have a low value of 10 for #{f}", ->
      card = new Card(suit,f)
      card.lowValue().should.equal 10
