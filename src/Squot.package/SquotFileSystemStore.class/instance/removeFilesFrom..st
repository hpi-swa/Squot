private
removeFilesFrom: artifactPath
	| reference |
	reference := directory resolve: artifactPath.
	(directory contains: reference) ifFalse: [^ self].
	(self metadataForObjectAt: reference) delete.
	reference deleteAll.