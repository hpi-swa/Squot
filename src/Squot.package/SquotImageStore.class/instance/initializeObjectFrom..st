private
initializeObjectFrom: anArtifact
	"The object in anArtifact is not present in me yet. Unpack it and keep it."
	| loadedObject |
	loadedObject := (self loaderFor: anArtifact) load: anArtifact replacing: nil.
	self add: loadedObject copiedFromArtifact: anArtifact.