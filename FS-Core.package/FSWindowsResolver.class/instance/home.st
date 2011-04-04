origins
home
	| pathString |
	pathString := SecurityManager default untrustedUserDirectory.
	^ (self resolveString: pathString) parent parent