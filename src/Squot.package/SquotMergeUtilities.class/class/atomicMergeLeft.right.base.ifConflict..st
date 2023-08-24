as yet unclassified
atomicMergeLeft: leftObject right: rightObject base: baseObject ifConflict: aBlock
	leftObject = rightObject ifTrue: [^ leftObject].
	leftObject = baseObject ifTrue: [^ rightObject].
	rightObject = baseObject ifTrue: [^ leftObject].
	^ aBlock value