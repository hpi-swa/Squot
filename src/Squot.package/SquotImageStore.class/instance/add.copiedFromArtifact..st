private
add: anObject copiedFromArtifact: anArtifact
	"Begin tracking anObject and remember anArtifacts information
	to recreate it later when creating a new snapshot."
	^ self add: anObject at: anArtifact path additionalInfo: anArtifact storeInfo copy