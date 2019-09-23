running
setUp
	| source |
	capturer := SquotObjectCapturer new.
	objectRegistry := SquotObjectRegistry new.
	capturer registry: objectRegistry.
	sharedObject := ValueHolder new contents: 1; yourself.
	source := Array with: sharedObject with: (Array with: sharedObject).
	patchedGraph := self patched: source asIn: [sharedObject contents: 2].
	nameOfSharedObject := objectRegistry nameOf: sharedObject.
	patchedShadowOfSharedObject := patchedGraph shadowNamed: nameOfSharedObject.