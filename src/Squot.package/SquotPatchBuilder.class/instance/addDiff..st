private
addDiff: aDiff
	aDiff hasChanges ifFalse: [^ self].
	loadOrderDiff := nil.
	loadOrderMerge := nil.
	(aDiff isAddition or: [(base artifactAt: aDiff path) = aDiff left])
		ifTrue: [diffs at: aDiff path put: aDiff]
		ifFalse: ["trying to apply a diff to a different base"
				diffs at: aDiff path put:
					(aDiff rebaseOn: base)].
	aDiff isAddition ifFalse: [(originalLoadOrder includes: aDiff path)
								ifFalse: [originalLoadOrder add: aDiff path]].
	aDiff isRemoval
		ifTrue: [patchedLoadOrder remove: aDiff path ifAbsent: []]
		ifFalse: [(patchedLoadOrder includes: aDiff path)
					ifFalse: [patchedLoadOrder add: aDiff path]].