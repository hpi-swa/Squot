callbacks for objects
added: incomingObjectReflection reachedVia: aReference ifSkipping: skipBlock
	(conflicts anySatisfy: [:each | each incoming artifact id = incomingObjectReflection object id])
		ifTrue: "Is part of a conflict already."
			[^ skipBlock value "Do not walk into the artifacts or metadata further"].
	additions add: (SquotArtifactAddition of: incomingObjectReflection object).
	^ skipBlock value "Do not walk into the artifacts or metadata further"