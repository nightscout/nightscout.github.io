(function() {

  $(function() {
    var $source, $sourceCode, $sourceHeader;
    $source = $('#source');
    $sourceHeader = $('#source-header');
    $sourceCode = $('#source-code');
    $sourceHeader.click(function() {
      return $sourceCode.toggle();
    });
    return $sourceHeader.trigger('click');
  });

}).call(this);
