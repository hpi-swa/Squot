tests
testUpdatesReferencesOfChangedShadows
	self patchGraph.
	self assert:
			(patchedGraph startShadow slots at: 1) value undecorated
				== patchedShadowOfSharedObject
		description: 'references not updated';
		assert:
			(patchedGraph startShadow slots at: 1) value undecorated
				== ((patchedGraph startShadow slots at: 2) value slots at: 1) value undecorated
		description: 'unconsistent references'.