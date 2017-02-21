public-accessing-objects
branches
"Answers a dictionary of all GitCommit objects referenced in '/refs/heads'."

	| dictionary heads |
	dictionary := Dictionary new.
	self headsDir exists ifFalse: [ ^ dictionary ].
	heads := self headsDir children.
	heads isEmpty
		ifFalse: [ heads do: [ :each |
			dictionary at: each basename put: 
				(each readStreamDo: [ :stream |
					self objectNamed: (stream next: 40) asString ]) ] ]
		ifTrue: [ | packedRefs | 
			packedRefs := self packedRefs .
			packedRefs ifNil: [ ^ dictionary ].
			packedRefs keysAndValuesDo: [ :refName :refHash | 
				(refName includesSubString: 'heads') ifTrue: [ 
					dictionary 
						at: refName
						put: (self objectNamed: refHash) ] ] ] .
		
	^ dictionary