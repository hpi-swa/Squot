as yet unclassified
adjustedBy: aDiffNode
	
	self diffs: ((aDiffNode children select: [:each | each isActive]) collect: [:each | each content]).
	^ self