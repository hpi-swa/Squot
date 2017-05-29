patching
removeFilesFrom: artifactPath
	| reference |
	reference := directory resolve: artifactPath.
	(self metadataForObjectAt: reference) delete.
	reference deleteAll.