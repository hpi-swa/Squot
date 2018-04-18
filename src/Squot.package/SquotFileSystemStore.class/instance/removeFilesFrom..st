private
removeFilesFrom: artifactPath
	| reference |
	reference := directory resolve: artifactPath.
	reference = directory ifTrue: [^ self].
	(self metadataForObjectAt: reference) delete.
	reference deleteAll.