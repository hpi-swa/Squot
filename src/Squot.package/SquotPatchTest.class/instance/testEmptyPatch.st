tests
testEmptyPatch
	| patch container |
	container := SquotSnapshot builder
					add: (SquotArtifactMock new path: 'a'; yourself);
					buildSnapshot.
	patch := SquotPatch noChangesTo: container.
	self assert: container artifacts equals: (container applyPatch: patch) artifacts.