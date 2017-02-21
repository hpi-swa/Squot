public-accessing-objects
tagNames
	| tagRefs tagNames packedRefs|
	tagRefs := self tagsDir children.
	tagRefs isEmpty
		ifFalse: [ ^ tagRefs collect: [ :ref | ref basename ] ].
	packedRefs := self packedRefs.
	packedRefs ifNil: [ ^ OrderedCollection new ].
	tagNames := OrderedCollection new.
	packedRefs keysAndValuesDo: [ :refName :refSignature | 
		(refName includesSubString: 'tags') ifTrue: [
			tagNames add: (refName subStrings: '/') last ] ].
	^ tagNames 