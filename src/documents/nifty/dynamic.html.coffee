### coffee
title: "Dynamic Content Example"
layout: "default"
dynamic: true
###

p "A random number #{Math.random()}"

if @req.body and @req.body.name
    name = @req.body.name
    p strong "Hello #{name}!".toUpperCase() + " Nice to meet you!"

form action: '?greeting', method: 'post', ->
    input name: 'name', placeholder: 'type your name here'
    input type: 'submit', value: 'submit'