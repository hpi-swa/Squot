callbacks
added: incomingObjectReflection reachedVia: aReference ifSkipping: skipBlock
	"Records that the object will be added to the graph."
	incomingObjectReflection shouldHaveNameAssigned ifFalse: [^ skipBlock value].
	additions at: (incoming nameOf: incomingObjectReflection object undecorated) put: (SquotObjectAddition of: incomingObjectReflection object undecorated).