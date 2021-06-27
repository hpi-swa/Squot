initialize-release
setReference: aReference leftOwner: leftGraph leftOwnerMirror: leftGraphMirror rightOwner: rightGraph rightOwnerMirror: rightGraphMirror objectDiff: aDiff
	super setReference: aReference leftOwner: leftGraph rightOwner: rightGraph.
	leftOwnerMirror := leftGraphMirror.
	rightOwnerMirror := rightGraphMirror.
	objectDiff := aDiff.
	