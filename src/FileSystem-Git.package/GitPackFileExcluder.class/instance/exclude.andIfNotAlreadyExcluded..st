private
exclude: aGitObject andIfNotAlreadyExcluded: aBlock
	(packFileCreator excludesObject: aGitObject) ifTrue: [^ self].
	packFileCreator excludeObject: aGitObject.
	aBlock value.