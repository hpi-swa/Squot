private
looseObjectPathFor: aHexHash
	^ 'objects/' , (aHexHash first: 2) , '/' , (aHexHash allButFirst: 2)