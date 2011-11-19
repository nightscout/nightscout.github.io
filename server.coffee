# -------------------------------------
# Configuration

# Requires
docpad = require 'docpad'
express = require 'express'

# Variables
oneDay = 86400000
expiresOffset = oneDay


# -------------------------------------
# DocPad Creation

# Configuration
docpadPort = process.env.DOCPADPORT || process.env.PORT || 10113

# Create Servers
docpadServer = express.createServer()

# Setup DocPad
docpadInstance = docpad.createInstance
	port: docpadPort
	maxAge: expiresOffset
	server: docpadServer
	plugins:
		admin: requireAuthentication: true
		rest: requireAuthentication: true

# Extract Logger
logger = docpadInstance.logger


# -------------------------------------
# Server Configuration

# DNS Servers
# masterServer.use express.vhost 'yourwebsite.*', docpadServer

# Start Server
# docpadInstance.action 'server'
docpadInstance.action 'server generate' # we need the generate for dynamic documents, if you don't utilise dynamic documents, then you just need the server


# -------------------------------------
# Server Extensions

# Place any custom routing here
# http://expressjs.com/



# -------------------------------------
# Exports

module.exports = docpadServer