tests
testUpdatesReferencesOfChangedShadows
	| source sharedObject patchedGraph patchedShadowOfSharedObject |
	sharedObject := ValueHolder new contents: 1; yourself.
	source := Array with: sharedObject with: (Array with: sharedObject).
	patchedGraph := self patched: source asIn: [sharedObject contents: 2].
	self assert: 
			((patchedShadowOfSharedObject := 
				patchedGraph shadowNamed: (objectRegistry nameOf: sharedObject))
				slots at: 'contents') = 2 captureWithSquot
		description: 'not patched correctly';
		assert:
			(patchedGraph startShadow slots at: 1) value undecorated
				== patchedShadowOfSharedObject
		description: 'references not updated';
		assert:
			(patchedGraph startShadow slots at: 1) value undecorated
				== ((patchedGraph startShadow slots at: 2) value slots at: 1) value undecorated
		description: 'unconsistent references'.