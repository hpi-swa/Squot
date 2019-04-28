collecting tracked files
pathAndMetadataFor: aFSReference

	| path |
	path := (aFSReference relativeTo: self rootDirectory) 
		segments fold: [:all :eachSegment | all,'/',eachSegment].
	^ path -> (LBGitFileMetadata new reference: aFSReference)