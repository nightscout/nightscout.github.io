### coffee
layout: 'default'
title: 'Search Results'
dynamic: true
###

p "A random number: #{Math.random()}"

ul ->
	query = @req.query.query
	for document in @documents
		continue  if document.title.indexOf(query) is -1  and  document.content.indexOf(query) is -1
		li 'typeof': 'sioc:Page', about: document.url, class: ('active'  if @document.url is document.url), ->
			a href: document.url, property: 'dc:title', ->
				text document.title