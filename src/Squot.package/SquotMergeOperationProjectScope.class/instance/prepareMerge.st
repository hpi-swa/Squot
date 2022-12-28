as yet unclassified
prepareMerge
	^ SquotToggles useNewApi
		ifTrue:
			[mergeOperation workingCopySnapshot
				squotMergeWith: mergeOperation mergeVersion snapshot
				basedOn: mergeOperation baseVersion snapshot]
		ifFalse:
			[mergeOperation workingCopy withCurrentSnapshot: mergeOperation  workingCopySnapshot do:
				[SquotMerge into: mergeOperation workingCopy
					merge: mergeOperation mergeVersion
					basedOn: mergeOperation baseVersion]]