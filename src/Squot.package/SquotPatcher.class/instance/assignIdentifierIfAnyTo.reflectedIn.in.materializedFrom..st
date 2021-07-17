private
assignIdentifierIfAnyTo: anObject reflectedIn: aMirror in: anObjectGraph materializedFrom: aShadow
	| name |
	name := self sourceNameOf: aShadow ifPresent: [:sourceName | sourceName] ifAbsent: [].
	(aMirror shouldObjectHaveNameAssigned: anObject)
		ifTrue:
			[name
				ifNil: ["Object should normally have a name, but maybe it is just materialized to be removed from a collection. Then it does not need to get a name in the registry or the new graph."]
				ifNotNil: [objectRegistry assign: name to: anObject]].
	name ifNotNil: [anObjectGraph assign: name to: anObject].