*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestors ifFail: aBlock
	| source sourceRequestor |
	source := aCollection first.
	sourceRequestor := requestors ifNotNil: #first.
	Parser new "check syntax"
		parse: source
		class: ProtoObject
		noPattern: true
		notifying: sourceRequestor
		ifFail: [^ aBlock value: 'failed to parse the source'].
	^ self class script: source packageName: self packageName