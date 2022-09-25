as yet unclassified
prepareMerge
	^ SquotToggles useNewApi
		ifTrue:
			[SquotProjectMergeFactory new merge: mergeOperation mergeVersion snapshot into: mergeOperation workingCopySnapshot basedOn: mergeOperation baseVersion snapshot]
		ifFalse:
			[mergeOperation workingCopy withCurrentSnapshot: mergeOperation  workingCopySnapshot do:
				[SquotMerge into: mergeOperation workingCopy
					merge: mergeOperation mergeVersion
					basedOn: mergeOperation baseVersion]]