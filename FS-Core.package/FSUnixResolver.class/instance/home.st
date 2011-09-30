origins
home
	| path |
	path := (self resolveString: self class primitiveGetUntrustedUserDirectory) path.
	"take the two topmost directories e.g. /home/USERNAME"
	path := FSAbsolutePath withAll: {path at: 1. path at: 2}.
	^ path asReference