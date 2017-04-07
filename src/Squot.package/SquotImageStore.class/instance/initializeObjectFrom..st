private
initializeObjectFrom: anArtifact
	"The object in anArtifact is not present in me yet. Unpack it and keep it."
	| loadedObject |
	anArtifact isLoadable ifFalse: [^ self].
	loadedObject := (self materializerFor: anArtifact) materialize: anArtifact replacing: nil.
	self add: loadedObject copiedFromArtifact: anArtifact.