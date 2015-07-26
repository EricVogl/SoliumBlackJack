chai = require 'chai'
chai.should()
Card = require '../src/card'

describe 'Card instance', ->
  card = null
  it 'should have a suit', ->
    card = new Card('\u2660','A')
    card.suit.should.equal '\u2660'
  it 'should have a rank', ->
    card = new Card('\u2660','A')
    card.rank.should.equal 'A'
  it 'should have a pretty print string value', ->
    card = new Card('\u2660','2')
    card.toString().should.equal '2\u2660'
  it 'should have a value of 11 for Ace', ->
    card = new Card('\u2660','A')
    card.value().should.equal 11
  it 'should have a value of 2 for 2', ->
    card = new Card('\u2660','2')
    card.value().should.equal 2
  it 'should have a value of 9 for 9', ->
    card = new Card('\u2660','9')
    card.value().should.equal 9
  it 'should have a value of 10 for Jack', ->
    card = new Card('\u2660','J')
    card.value().should.equal 10
  it 'should have a value of 10 for Queen', ->
    card = new Card('\u2660','Q')
    card.value().should.equal 10
  it 'should have a value of 10 for King', ->
    card = new Card('\u2660','K')
    card.value().should.equal 10
