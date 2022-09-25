accessing artifacts
updateArtifact: anArtifactMerge
	"Update the artifact in storage according to the merge instructions."
	"This is the fallback implementation for stores that cannot update only the changed parts."
	self flag: #todo. "Ensure that the result graph has the changes from the merge dialog."
	self putArtifact: anArtifactMerge result.