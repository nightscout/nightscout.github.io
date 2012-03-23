$ ->
  # Toggle the "view source"
	$source = $('#source')
	$sourceHeader = $('#source-header')
	$sourceCode = $('#source-code')
	$sourceHeader.click ->
		$sourceCode.toggle()
	$sourceHeader.trigger('click')

