private
mergeReference: workingReference with: incomingReference basedOn: baseReference advancing: aGraphWalk
	| baseName incomingName workingName |
	workingName := working nameOf: workingReference value undecorated ifAbsent: [].
	incomingName := incoming nameOf: incomingReference value undecorated ifAbsent: [].
	baseName := base nameOf: baseReference value undecorated ifAbsent: [].
	workingName = incomingName
		ifTrue:
			[workingName = baseName
				ifTrue: ["same objects, but might have changed"
						aGraphWalk nextPut: {workingReference value. incomingReference value. baseReference value}.
						elementMerges at: workingReference value undecorated put:
							(workingReference value
								squotMergeWith: incomingReference value
								basedOn: baseReference value)]
				ifFalse: ["both were changed to the same object, but no diff here"
						self notYetImplemented]]
		ifFalse:
			["distinct objects"
			self notYetImplemented].