loading
loadWith: imageStore replacing: anObject
	"Answer myself as the object in the image."
	self flag: 'Another possiblity would be to place fileReferences in the image'.
	self assert: (anObject isNil or: [anObject species = self species]).
	^ self "do not invoke the store's loading facilities"