merging
atomicMergeLeft: leftObject
right: rightObject
base: baseObject
ifUnchanged: unchangedBlock
ifMerged: mergedBlock
ifConflict: conflictBlock
	(leftObject squotEqual: rightObject) ifTrue: [^ unchangedBlock value].
	(leftObject squotEqual: baseObject )ifTrue: [^ mergedBlock value: rightObject].
	(rightObject squotEqual: baseObject) ifTrue: [^ unchangedBlock value].
	^ conflictBlock value: (SquotMergeConflict left: leftObject right: rightObject base: baseObject)