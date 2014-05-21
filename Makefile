
out: src
	./node_modules/.bin/docpad generate --env static


travis: out
	./build.sh

.PHONY: travis
