callbacks
added: incomingTargetReflection at: pathCollection
	diffs at: pathCollection put:
		(SquotReferenceAddition to: currentWorking object
			reference: pathCollection last
			target: incomingTargetReflection object
			rightOwner: currentIncoming object).