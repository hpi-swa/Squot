private
copiedTreeForModification: aTree at: aPath
	| copy |
	((copiedTrees ifNil: [copiedTrees := IdentitySet new])
		includes: aTree) ifTrue: [^ aTree].
	aTree isEmpty ifTrue:
		[self logMessage: 'For a created entry, putting empty tree at ', aPath parent printString].
	copy := self newTreeFrom: aTree.
	copiedTrees add: copy.
	treeMap at: aPath put: copy.
	^ copy