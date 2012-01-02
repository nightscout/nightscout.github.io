(function() {

  $(function() {
    var $, editMode;
    editMode = false;
    if (window.jQuery == null) {
      if (console.log != null) {
        console.log('DocPad Administratio plugin requires jQuery...');
      }
      return;
    }
    $ = window.jQuery;
    $('[contenteditable]').live('focus', function() {
      var $this;
      $this = $(this);
      $this.data('before', $this.html());
      return $this;
    }).live('blur paste', function() {
      var $this, before;
      $this = $(this);
      before = $this.data('before');
      if ($this.data('before') !== $this.html()) {
        $this.data('before', $this.html());
        $this.trigger('change');
      }
      return $this;
    });
    $(document).bind('keypress', function(event) {
      if (event.which === 180 && event.shiftKey && (event.ctrlKey || event.altKey)) {
        editMode = !editMode;
        if (console.log != null) {
          console.log('DocPad edit mode ' + (editMode ? 'enabled' : 'disabled'));
        }
      }
      return $('[property]').attr('contenteditable', editMode);
    });
    return $('[property]').live('change', function() {
      var $article, $field, data, key, url, value;
      $field = $(this);
      $article = $field.parents('[typeof="sioc:Post"]:first');
      if (!$article.length) return;
      url = $article.attr('about');
      key = $field.attr('property');
      value = $field.html();
      data = {};
      data[key] = value;
      return $.ajax({
        url: url,
        type: 'POST',
        data: data,
        success: function(data, textStatus, jqXHR) {
          return console.log('success:', arguments);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          return console.log('error:', arguments);
        }
      });
    });
  });

}).call(this);
