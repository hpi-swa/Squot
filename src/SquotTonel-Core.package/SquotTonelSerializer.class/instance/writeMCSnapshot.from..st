as yet unclassified
writeMCSnapshot: aMonticelloSnapshot from: anArtifact
	(TonelWriterForFileSystem on: directory parent "the writer creates the package directory")
		writeSnapshot: aMonticelloSnapshot.