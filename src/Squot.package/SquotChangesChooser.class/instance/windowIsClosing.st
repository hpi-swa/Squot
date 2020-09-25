updating
windowIsClosing
	"Resolve or reject the promise."
	promise ifNotNil:
		[self accepted ifTrue: [promise resolveWith: self] ifFalse: [promise rejectWith: self]].