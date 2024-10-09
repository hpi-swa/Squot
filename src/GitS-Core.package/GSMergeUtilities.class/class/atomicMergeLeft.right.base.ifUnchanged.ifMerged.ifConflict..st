merging
atomicMergeLeft: leftObject
right: rightObject
base: baseObject
ifUnchanged: unchangedBlock
ifMerged: mergedBlock
ifConflict: conflictBlock
	(leftObject = rightObject) ifTrue: [^ unchangedBlock value].
	(leftObject = baseObject )ifTrue: [^ mergedBlock value: rightObject].
	(rightObject = baseObject) ifTrue: [^ unchangedBlock value].
	^ conflictBlock value: (GSMergeConflict left: leftObject right: rightObject base: baseObject)