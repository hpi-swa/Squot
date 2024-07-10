merging
mergeVersion: right into: left withBase: base
	| merged |
	merged := self transformVersion:
					(SquotMergeUtilities
						stringOrNilMergeLeft: left
						right: right
						base: base
						ifConflict: [^ SquotPlaintextConflictChangeSet
										withMapper: self
										conflict: (SquotMergeConflict left: left right: right base: base)]).
	^ (merged squotEqual: left)
		ifTrue: [SquotEmptyChangeSet withMapper: self]
		ifFalse: [SquotPlaintextNormalChangeSet withMapper: self from: left to: merged]