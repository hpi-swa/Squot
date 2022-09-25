callbacks
reached: workingCopyObjectReflection at: pathCollection
	currentWorking object == working ifTrue: "Do not record graph as referrer." [^ self].
	(referrers at: workingCopyObjectReflection object undecorated ifAbsentPut: [OrderedCollection new])
		add: currentWorking -> pathCollection.