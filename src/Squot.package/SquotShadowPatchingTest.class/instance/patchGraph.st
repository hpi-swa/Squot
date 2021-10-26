tests
patchGraph
	| source |
	sharedObject := ValueHolder new contents: 1; yourself.
	source := Array with: sharedObject with: (Array with: sharedObject) with: Array new.
	patchedGraph := self patched: source asIn:
		[sharedObject contents: 2.
		source at: 3 put: (Array with: (source at: 3))].
	nameOfSharedObject := objectRegistry nameOf: sharedObject.
	patchedShadowOfSharedObject := patchedGraph shadowNamed: nameOfSharedObject.
	^ patchedGraph