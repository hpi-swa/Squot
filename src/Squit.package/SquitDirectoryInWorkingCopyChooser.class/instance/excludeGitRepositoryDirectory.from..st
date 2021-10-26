private
excludeGitRepositoryDirectory: aFSFileDirectoryAdapter from: anArray
	| index result |
	result := anArray.
	index := anArray indexOf: aFSFileDirectoryAdapter.
	index ~= 0 ifTrue: [result := anArray copyWithoutIndex: index].
	^ result