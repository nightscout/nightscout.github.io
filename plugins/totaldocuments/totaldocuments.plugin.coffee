# Export Plugin
module.exports = (BasePlugin) ->

	# Define Plugin
	class TotalDocumentsPlugin extends BasePlugin
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