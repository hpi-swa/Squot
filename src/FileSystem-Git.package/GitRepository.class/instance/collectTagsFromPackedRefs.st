private
collectTagsFromPackedRefs
	| tags packedRefs |
	tags := Dictionary new.
	
	packedRefs := self packedRefs. 
	packedRefs ifNotNil: [
		packedRefs keysAndValuesDo: [ :refName :refHash | 
			(refName includesSubString: 'tags') ifTrue: [
				tags
					at: refName
					put: (self objectNamed: refHash) ] ] ].
	
	^ tags