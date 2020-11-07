private
addDiff: aDiff
	(aDiff isBasedOn: base)
		ifTrue: [diffs at: aDiff path put: aDiff]
		ifFalse: ["trying to apply a diff to a different base"
				diffs at: aDiff path put:
					(aDiff rebaseOn: base)].
	aDiff isAddition ifFalse: [(originalLoadOrder includes: aDiff path)
								ifFalse: [originalLoadOrder add: aDiff path.
										loadOrderMerge := nil]].
	aDiff isRemoval
		ifFalse: [(patchedLoadOrder includes: aDiff path)
					ifFalse:
						[patchedLoadOrder add: aDiff path.
						self updateLoadOrder]].