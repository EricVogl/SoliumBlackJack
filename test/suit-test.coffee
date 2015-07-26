chai = require 'chai'
chai.should()
Suit = require '../src/suit'

describe 'Suit instance', ->
  suit = null
  it 'should have a name', ->
    suit = new Suit('name', 'symbol')
    suit.name.should.equal 'name'
  it 'should have a symbol', ->
    suit = new Suit('name', 'symbol')
    suit.symbol.should.equal 'symbol'
