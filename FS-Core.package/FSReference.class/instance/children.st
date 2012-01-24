navigating
children
	"Answer an array containing references to the direct children
	of this reference."

	^ (self filesystem childrenAt: self path) collect: [:ea |
		FSReference
			filesystem: self filesystem
			path: ea]