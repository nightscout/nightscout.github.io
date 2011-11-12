### coffee
title: 'Asynchronous templates'
layout: 'default'
async: true
ignore: true
###

h2 "Not yet possible, has to be implemented by the templating engine, not docpad"

###
h2 "The contents of this file are as follows"
fs.readFile "#{__file}", (err,data) =>
	code h data.toString()
	@next()
###