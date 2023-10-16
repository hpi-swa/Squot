*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestor ifFail: aBlock
	| source |
	source := aCollection first.
	Parser new "check syntax"
		parse: source
		class: ProtoObject
		noPattern: true
		notifying: requestor
		ifFail: [^ aBlock value: 'failed to parse the source'].
	^ self class script: source packageName: self packageName