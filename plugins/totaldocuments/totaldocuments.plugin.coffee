# Requires
DocpadPlugin = require "docpad/lib/plugin.coffee"

# Define Plugin
class TotalDocumentsPlugin extends DocpadPlugin
	# Plugin Name
	name: 'totaldocuments'

	# Ammend our Template Data
	renderBefore: ({templateData}, next) ->
		# Prepare
		documents = @docpad.documents
		totalDocuments = 0
		 
		# Find documents
		documents.find {}, (err,docs,length) ->
			# Doesn't have to write to the site document, but it certainly could
			templateData.site.totalDocuments = length
			
			# All done
			# Continue onto the next plugin
			next()
	
# Export Plugin
module.exports = TotalDocumentsPlugin