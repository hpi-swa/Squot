private
computeDifferences
	| graphWalk |
	graphWalk := SquotGraphWalk guidedBy: self.
	self mergeStartReferencesToStart: graphWalk.
	graphWalk do:
		[:eachTriple | | object workingObject incomingObject baseObject name |
		object := eachTriple first ifNil: [eachTriple second ifNil: [eachTriple third]].
		name := working nameOf: object undecorated
			ifAbsent:
				[incoming nameOf: object undecorated
					ifAbsent: [base nameOf: object undecorated ifAbsent: []]].
		workingObject := object sameIn: working withName: name ifAbsent: [].
		incomingObject := object sameIn: incoming withName: name ifAbsent: [eachTriple second].
		baseObject := object sameIn: base withName: name ifAbsent: [eachTriple third].
		self mergeObject: workingObject with: incomingObject basedOn: baseObject].