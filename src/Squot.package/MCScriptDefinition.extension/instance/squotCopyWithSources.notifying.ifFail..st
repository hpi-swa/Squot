*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestor ifFail: aBlock
	| source |
	source := aCollection first.
	[Parser new "check syntax"
		parse: source
		class: ProtoObject
		noPattern: false
		notifying: requestor
		ifFail: [^ aBlock value: 'failed to parse the source']]
		on: UndeclaredVariable
		do: [:exception | exception resume: UndeclaredVariableNode new].
	^ self class script: source packageName: self packageName