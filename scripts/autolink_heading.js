(function() {
  var autolink_header;

  autolink_header = function() {
    return $('H1, H2, H3, H4, H5, H6').filter('[id]').each(function(i, v) {
      var el, link, val;
      el = $(this);
      val = '#' + el.attr('id');
      link = $('<A>').attr({
        name: val,
        href: val
      }).addClass('permalink autolink').append($('<SPAN>').addClass('icon-link xxfa-anchor').text(' '));
      return el.addClass('autolink header').prepend(link);
    });
  };

  $(document).ready(autolink_header);

}).call(this);
