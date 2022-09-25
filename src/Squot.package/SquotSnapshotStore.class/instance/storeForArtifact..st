accessing
storeForArtifact: anArtifact
	self assert: ((project artifacts includes: anArtifact) or: [project artifacts anySatisfy: [:each | each path = anArtifact path]]).
	^ self