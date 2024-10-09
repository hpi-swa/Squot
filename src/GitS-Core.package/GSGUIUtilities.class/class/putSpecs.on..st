children
putSpecs: anObject on: aStream
	anObject ifNil: [^ self].
	anObject isCollection ifTrue: [^ anObject do: [:each | self putSpecs: each on: aStream]].
	aStream nextPut: anObject.