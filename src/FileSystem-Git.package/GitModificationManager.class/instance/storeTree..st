operations
storeTree: aTree 
	(storedObjects includes: aTree) ifTrue: [ ^ self ].
	storedObjects add: aTree.
	"don't store empty trees"
	aTree isEmpty ifFalse: [ aTree store ].