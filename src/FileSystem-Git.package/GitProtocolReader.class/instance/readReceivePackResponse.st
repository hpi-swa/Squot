receiving
readReceivePackResponse
	| report unpackStatus |
	report := GitReceivePackStatusReport new.
	unpackStatus := self readPktLine.
	self assert: (unpackStatus beginsWith: 'unpack ').
	report unpackStatus: (unpackStatus allButFirst: 7).
	self readLines: [:each | | ref message |
		self assert: ((each beginsWith: 'ok ') or: [each beginsWith: 'ng ']).
		ref := each allButFirst: 3.
		(each beginsWith: 'ng ')
			ifTrue: [message := ref copyAfter: $ .
				report error: message forReference: (ref copyUpTo: $ )]
			ifFalse: [report successForReference: ref]].
	^ report