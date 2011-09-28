# Requires
buildr = require 'buildr'
util = require 'util'

# Configs
configs =
	standard:
		# Options
		name: 'standard'

		# Paths
		srcPath: __dirname+'/out'
		outPath: __dirname+'/out'

		# Compression (without outPath only the generated bundle files are compressed)
		compressStyles: true # Array or true or false
		compressScripts: true # Array or true or false

		# Order
		stylesOrder: [
			'styles/style.less'
		]
		scriptsOrder: [
			'scripts/script.coffee'
		]

		# Bundling
		bundleStylePath: __dirname+'/out/styles.css'
		bundleScriptPath: __dirname+'/out/scripts.js'

# Standard
standardConfig = configs.standard
standardBuildr = buildr.createInstance configs.standard
standardBuildr.process()
