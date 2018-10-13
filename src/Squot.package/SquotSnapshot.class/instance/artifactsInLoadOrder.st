enumerating
artifactsInLoadOrder
	| orderedArtifacts |
	orderedArtifacts := OrderedCollection new.
	self artifactsInLoadOrderDo: [:each | orderedArtifacts add: each].
	^ orderedArtifacts