### coffee
layout: "default"
title: "Client-Side Editing"
description: "You can edit this with content-editable, and it will save automatically. So when you refresh, it'll be what you saved it as. I can edit this."
###

article 'typeof': 'sioc:Post', about: @document.url, ->
    h1 property: 'title', -> @document.title
    div property: 'description', -> @document.description
    div @document.url
