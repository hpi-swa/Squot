private
ifAllUpToDate: updateAssociations andDeleted: deleteRefs do: aBlock
	(updateAssociations anySatisfy: [:update |
		(refs includesKey: update key) not
		or: [(refs at: update key) ~= update value hexHash]]) ifTrue: [^ self].
	(deleteRefs anySatisfy: [:each | refs includesKey: each]) ifTrue: [^ self].
	^ aBlock value