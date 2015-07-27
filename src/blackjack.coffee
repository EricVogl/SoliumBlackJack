Deck = require './deck'

deck = new Deck
console.log "#{deck.toString()}"
deck.shuffle()
test = process.stdin.readline
console.log test

card = deck.nextCard()
process.stdout.write
console.log "#{card.toString()}#{card.value()}"
