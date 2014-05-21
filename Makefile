
out: src
	./node_modules/.bin/docpad generate --env static


travis: out
	env ./build.sh

.PHONY: travis
