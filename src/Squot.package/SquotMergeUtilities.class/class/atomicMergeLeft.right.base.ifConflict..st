merging
atomicMergeLeft: leftObject right: rightObject base: baseObject ifConflict: aBlock
	(leftObject squotEqual: rightObject) ifTrue: [^ leftObject].
	(leftObject squotEqual: baseObject )ifTrue: [^ rightObject].
	(rightObject squotEqual: baseObject) ifTrue: [^ leftObject].
	^ aBlock value