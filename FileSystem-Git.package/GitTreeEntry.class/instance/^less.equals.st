comparing
<= other
	"For sorting reasons, directories are compared
	with a virtual slash appended."
	| myTail otherTail |
	myTail := otherTail := ''.
	self mode = (self class dirMode)
		ifTrue: [ myTail := '/' ].
	other mode = (self class dirMode)
		ifTrue: [otherTail := '/' ].
	
	^ self entryName, myTail <= (other entryName, otherTail)