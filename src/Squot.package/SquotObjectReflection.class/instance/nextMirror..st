reflection
nextMirror: aReference
	^ mirror mirrorOf: (aReference reflect: object in: mirror) undecorated reachedVia: aReference from: object