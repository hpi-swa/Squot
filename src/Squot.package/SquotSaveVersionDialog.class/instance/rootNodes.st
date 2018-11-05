ui
rootNodes
	diffRootNodes ifNotNil: [^ diffRootNodes].
	diffRootNodes := OrderedCollection new.
	editedPatch diffsDo: [:each | diffRootNodes add: each asDiffTree].
	^ diffRootNodes