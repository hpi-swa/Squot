reflection
nextMirror: aReference
	^ mirror mirrorOf: (aReference reflect: object in: mirror) reachedVia: aReference from: object