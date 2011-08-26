# Requires
docpad = require 'docpad'
express = require 'express'

# Variables
oneDay = 86400000
expiresOffset = oneDay


# -------------------------------------
# Server

# Configuration
masterPort = process.env.PORT || 10113

# Create Server
masterServer = express.createServer()

# Setup DocPad
docpadPort = masterPort
docpadServer = masterServer
docpadInstance = docpad.createInstance {
	port: docpadPort
	maxAge: expiresOffset
	server: masterServer
}

# -------------------------------------
# Middlewares

# Configure
docpadServer.configure ->
	### Correct Domain Middleware
	docpadServer.use (req,res,next) ->
		if req.headers.host in ['www.yourwebsite.com']
			res.redirect 'http://yourwebsite.com'+req.url, 301
			res.end()
		else
			next()
	###

	# Static Middleware
	docpadInstance.serverAction (err) -> throw err  if err

	# Router Middleware
	docpadServer.use docpadServer.router

	# 404 Middleware
	docpadServer.use (req,res,next) ->
		res.send(404)


# -------------------------------------
# Start Server

# Start Server
masterServer.listen masterPort
console.log 'Express server listening on port %d', masterServer.address().port

# DNS Servers
# masterServer.use express.vhost 'yourwebsite.*', docpadServer


# -------------------------------------
# Redirects

# Place your redirects here