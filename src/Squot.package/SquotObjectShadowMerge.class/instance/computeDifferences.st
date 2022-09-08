private
computeDifferences
	"Only note the differences in my references, do not engage in comparisons of the
	referenced objects. This must be managed by the SquotObjectGraphMerge that contains
	me."
	self flag: #encapsulation. "knows about the structure of slots (keys)"
	self flag: SquotNameDecorator. "relies on object name decorations"
	working slots keys do:
		[:each | | workingValue incomingValue baseValue |
		workingValue := working slots at: each.
		incomingValue := incoming slots at: each ifAbsent: [].
		baseValue := base slots at: each ifAbsent: [].
		incomingValue
			ifNotNil:
				[((workingValue hasSquotShadowName and: [incomingValue hasSquotShadowName]) or: [workingValue canHaveNameAssignedBySquot not and: [incomingValue canHaveNameAssignedBySquot not]]) ifFalse: [self notYetImplemented "for value objects, such as Point"].
				workingValue name = incomingValue name ifFalse: 
					[incomingValue name = baseValue name
						ifTrue: ["working modification, do nothing (could have deep changes though)"]
						ifFalse: [workingValue name = baseValue name
									ifTrue: ["incoming modification (could have deep changes though)"
											containerModifications at: each put: 
												(SquotSlotReassignment key: each
													leftShadow: (working slots at: each)
													rightShadow: (incoming slots at: each))]
									ifFalse: ["conflicting modification"
											containerConflicts at: each put:
												(SquotObjectReferenceConflict new
													key: (working slots associationAt: each) asReference;
													base: (base slots associationAt: each);
													working: (working slots at: each);
													incoming: (incoming slots at: each);
													yourself)]]]]
			ifNil:
				[(working slots at: each) name = baseValue name
					ifTrue: ["incoming removal" self notYetImplemented]
					ifFalse: ["conflicting removal" self notYetImplemented]]].
	(incoming slots keys copyWithoutAll: working slots keys) do:
		[:each | | incomingValue baseValue |
		incomingValue := incoming slots at: each ifAbsent: [].
		baseValue := base slots at: each ifAbsent: [].
		baseValue
			ifNil: ["incoming addition" self notYetImplemented]
			ifNotNil:
				[incomingValue name = baseValue name
					ifTrue: ["working removal, do nothing (could have deep changes though)"]
					ifFalse: ["conflicting modification" self notYetImplemented]]].