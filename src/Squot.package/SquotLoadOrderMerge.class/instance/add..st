patching
add: aSquotArtifact
	"Note the addition."
	self assert: (working includes: aSquotArtifact path) not.
	containerModifications at: aSquotArtifact path put: #add.