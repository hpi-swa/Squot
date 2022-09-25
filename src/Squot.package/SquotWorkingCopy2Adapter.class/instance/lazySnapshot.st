accessing objects
lazySnapshot
	"Answer snapshot whose artifacts are captured on demand -- this is the default behavior anyway -- but with the paths as the keys, not the ids."
	^ SquotProjectSnapshot fromStore: self