public
isFile: aResolvable
	"Resolve the argument, and answer true if the result refers
	to a file, false if it refers to a directory or doesn't exist."

	| path |
	path := self resolve: aResolvable.
	^ store isFile: path