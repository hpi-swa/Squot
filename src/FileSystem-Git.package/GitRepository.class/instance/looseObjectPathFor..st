private
looseObjectPathFor: aHexHash
	self privateDeprecatedUseUnitOfWork.
	^ 'objects/' , (aHexHash first: 2) , '/' , (aHexHash allButFirst: 2)