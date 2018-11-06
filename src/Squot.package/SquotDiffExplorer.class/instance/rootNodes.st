ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := Array streamContents: [:stream |
		patch diffsDo: [:each | stream nextPut: each asDiffTree]].
	^ rootNodes