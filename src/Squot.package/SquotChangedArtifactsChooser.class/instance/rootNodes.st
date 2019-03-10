ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch diffsDo: [:each | | root |
		self flag: #smell. "SquotArtifactDiff vs. SquotArtifactConflict"
		root := each asDiffTree
			includeBlock: [each hasConflicts
							ifTrue: [editedPatch addDiff: each rightDiff]
							ifFalse: [editedPatch addDiff: each]];
			excludeBlock: [each hasConflicts
							ifTrue: [editedPatch addDiff: each leftDiff]
							ifFalse: [editedPatch resetAt: each path]];
			yourself.
		each hasConflicts ifTrue:
			[root resetBlock: [editedPatch addDiff: each]].
		rootNodes add: root].
	^ rootNodes