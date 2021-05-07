initialize-release
setReference: aReference leftOwner: leftObject target: leftTargetObject rightOwner: rightObject target: rightTargetObject
	super setReference: aReference leftOwner: leftObject rightOwner: rightObject.
	leftTarget := leftTargetObject.
	rightTarget := rightTargetObject.