enumerating
checkPathsTo: anObject ifMultiple: aBlock
	"Allow multiple-path pruning by evaluating aBlock if anObject has already been visited. If not, it will be remembered for future checks."
	numberOfPathChecks := numberOfPathChecks + 1.
	(self hasVisited: anObject) ifTrue: [aBlock value].
	self visited: anObject.