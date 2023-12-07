merging
atomicMergeLeft: leftObject right: rightObject base: baseObject ifSuccess: successBlock ifConflict: conflictBlock
	^ successBlock value:
		(self
			atomicMergeLeft: leftObject
			right: rightObject
			base: baseObject
			ifConflict: [^ conflictBlock value])