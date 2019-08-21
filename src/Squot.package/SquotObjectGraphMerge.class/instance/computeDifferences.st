private
computeDifferences
	| graphWalk |
	graphWalk := SquotGraphWalk guidedBy: self.
	self mergeReference: working startShadowReference
		with: incoming startShadowReference
		basedOn: base startShadowReference
		advancing: graphWalk.
	graphWalk do:
		[:eachTriple | | object workingObject incomingObject baseObject name |
		object := eachTriple first.
		name := working nameOf: object undecorated
			ifAbsent:
				[incoming nameOf: object undecorated
					ifAbsent: [base nameOf: object undecorated ifAbsent: []]].
		workingObject := name ifNotNil: [working shadowNamed: name ifAbsent: []].
		incomingObject := eachTriple second ifNil: [name ifNotNil: [incoming shadowNamed: name ifAbsent: []]].
		baseObject := eachTriple third ifNil: [name ifNotNil: [base shadowNamed: name ifAbsent: []]].
		self mergeObject: workingObject with: incomingObject basedOn: baseObject].