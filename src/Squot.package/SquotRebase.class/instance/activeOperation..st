accessing
activeOperation: aRebaseOperation
	(aRebaseOperation isNil or: [aRebaseOperation isHeader])
		ifTrue: [activeOperation := nil]
		ifFalse: [
			self assert: (self operations includes: aRebaseOperation).
			activeOperation := aRebaseOperation].
	self changed: #activeOperation.