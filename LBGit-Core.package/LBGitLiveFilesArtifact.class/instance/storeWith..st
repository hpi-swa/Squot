as yet unclassified
storeWith: anObjectContainer

	"This is called at an artifact creation diff"
	| recordedFilesArtifact |
	recordedFilesArtifact := anObjectContainer artifacts at: self path.
	(recordedFilesArtifact diffAgainst: self) applyToContainer: anObjectContainer.