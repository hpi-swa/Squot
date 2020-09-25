updating
windowIsClosing
	"Resolve or reject the promise."
	self accepted ifTrue: [promise resolveWith: self] ifFalse: [promise rejectWith: self].