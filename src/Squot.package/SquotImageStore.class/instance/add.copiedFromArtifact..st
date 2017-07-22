private
add: anObject copiedFromArtifact: anArtifact
	"Begin tracking anObject and remember anArtifacts information
	to recreate it later when creating a new snapshot."
	| metadata |
	metadata := anArtifact storeInfo copy.
	anObject squotAddTransientStoreInfoTo: metadata.
	^ self add: anObject at: anArtifact path additionalInfo: metadata