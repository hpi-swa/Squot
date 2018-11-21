ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch diffsDo: [:each | rootNodes add: each asDiffTree].
	^ rootNodes