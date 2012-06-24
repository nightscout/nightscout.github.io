# Export Plugin
module.exports = (BasePlugin) ->

	# Define Plugin
	class TotalDocumentsPlugin extends BasePlugin
		# Plugin Name
		name: 'totaldocuments'

		# Ammend our Template Data
		renderBefore: ({templateData}) ->
			# Prepare
			database = @docpad.getDatabase()
			
			# Apply to the global templateData
			templateData.site.totalDocuments = database.length