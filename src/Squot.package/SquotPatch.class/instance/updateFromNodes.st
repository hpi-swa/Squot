as yet unclassified
updateFromNodes
	"Traverse the diff nodes and update me if they are deactivated"
	self deprecated.
	diffs := diffs collect: [:each | self adjustedDiffFromNodes: each].