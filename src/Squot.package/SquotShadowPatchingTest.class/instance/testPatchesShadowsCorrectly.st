tests
testPatchesShadowsCorrectly
	self assert: 
			((patchedGraph shadowNamed: (objectRegistry nameOf: sharedObject))
				slots at: 'contents') = 2 captureWithSquot
		description: 'not patched correctly'.