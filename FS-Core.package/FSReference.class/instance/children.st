navigating
children
	"Answer an array containing references to the direct children
	of this reference."

	^ (filesystem childrenAt: path) collect: 
		[:ea |
		FSReference
			filesystem: filesystem
			path: ea]