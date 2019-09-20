private
mergeObject: workingObject with: incomingObject basedOn: baseObject
	"Trigger merge of these object editions and record the merge.
	Also note when an object has been added or removed, possibly creating conflicts."
	| object merge |
	object := workingObject ifNil: [incomingObject ifNil: [baseObject]].
	(elementMerges includesKey: object) ifTrue: [^ self].
	workingObject
		ifNil:
			[baseObject
				ifNil: ["incoming additon"
					(incoming nameOf: incomingObject ifAbsent: []) ifNotNil:
						[:name | containerModifications at: name put:
									(SquotObjectAddition of: incomingObject)]]
				ifNotNil: ["working removal" self notYetImplemented]]
		ifNotNil:
			[incomingObject
				ifNil: ["incoming removal" self notYetImplemented]
				ifNotNil:
					["merge editions"
					baseObject ifNil: [self notYetImplemented].
					merge := workingObject squotMergeWith: incomingObject basedOn: baseObject.
					merge hasChanges ifTrue: [elementMerges at: object put: merge]]].