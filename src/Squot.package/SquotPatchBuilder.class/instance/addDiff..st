private
addDiff: aDiff
	aDiff hasChanges ifTrue:
		[diffs at: aDiff path put: aDiff.
		aDiff isAddition ifFalse: [(originalLoadOrder includes: aDiff path)
									ifFalse: [originalLoadOrder add: aDiff path]].
		aDiff isRemoval
			ifTrue: [patchedLoadOrder remove: aDiff path ifAbsent: []]
			ifFalse: [(patchedLoadOrder includes: aDiff path)
						ifFalse: [patchedLoadOrder add: aDiff path]]].