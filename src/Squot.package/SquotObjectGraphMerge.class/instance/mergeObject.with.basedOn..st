private
mergeObject: workingObject with: incomingObject basedOn: baseObject
	"Trigger merge of these object editions and record the merge.
	Also note when an object has been added or removed, possibly creating conflicts."
	| object name merge |
	object := workingObject ifNil: [incomingObject ifNil: [baseObject]].
	name := self keyOf: object ifAbsent: [^ self "value objects are not merged"].
	(elementMerges includesKey: name) ifTrue: [^ self "already done"].
	workingObject
		ifNil:
			[baseObject
				ifNil: ["incoming additon"
					containerModifications
						at: name
						put: (SquotObjectAddition of: incomingObject)]
				ifNotNil: ["working removal" self notYetImplemented]]
		ifNotNil:
			[incomingObject
				ifNil: ["incoming removal" self notYetImplemented]
				ifNotNil:
					["merge editions"
					baseObject ifNil: [self notYetImplemented].
					merge := workingObject squotMergeWith: incomingObject basedOn: baseObject.
					merge hasChanges ifTrue: [elementMerges at: name put: merge]]].