$(window).load(function() {
  $("input:text:visible:first").focus();

  $('#results').on('click', 'div#details', function() {
    $('#details').remove();
  });

  $('table a').bind('click', function(e) {
    var url = $(this).attr('href');
    var parent_position = $(this).parents('tr').children('td[lang=ar]').position();
    var parent_width = $(this).parents('tr').children('td[lang=ar]').outerWidth();
    if ($('#details').length == 0) { $('#results').append('<div id="details"></div>'); }
    $('#details').load(url);
    $('#details').offset({top: parent_position.top-1, left: parent_position.left+parent_width+10});
    $('#details').show();
    return false;
  });
});
