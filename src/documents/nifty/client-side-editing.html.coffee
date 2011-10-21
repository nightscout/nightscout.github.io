### coffee
layout: "default"
title: "Client-Side Editing"
description: "You can edit this with content-editable, and it will save automatically. So when you refresh, it'll be what you saved it as."
###

article 'typeof': 'sioc:Post', about: @document.url, ->
    h1 property: 'title', -> @document.title
    div property: 'description', -> @document.description
    div @document.url

coffeescript ->
    $ ->
        $('[contenteditable]')
            .live 'focus', ->
                $this = $(this)
                $this.data 'before', $this.html()
                $this
            .live 'blur paste', ->
                $this = $(this)
                before = $this.data('before')
                if $this.data('before') isnt $this.html()
                    $this.data 'before', $this.html()
                    $this.trigger('change')
                $this
    
        $('[property]').attr('contenteditable',true).live 'change', ->
            $field = $(this)
            
            $article = $field.parents('[typeof="sioc:Post"]:first')
            return  unless $article.length
            url = $article.attr('about')
            
            key = $field.attr('property')
            value = $field.html()
            
            data = {}
            data[key] = value
            
            $.ajax(
                url: url
                type: 'POST'
                data: data
                success: (data, textStatus, jqXHR) ->
                    console.log('success:',arguments)
                error: (jqXHR, textStatus, errorThrown) ->
                    console.log('error:',arguments)
            )