instance creation
reference: aReference leftOwner: leftGraph reflectedIn: leftGraphMirror rightOwner: rightGraph reflectedIn: rightGraphMirror objectDiff: aDiff
	^ self new
		setReference: aReference
		leftOwner: leftGraph
		leftOwnerMirror: leftGraphMirror
		rightOwner: rightGraph
		rightOwnerMirror: rightGraphMirror
		objectDiff: aDiff;
		yourself