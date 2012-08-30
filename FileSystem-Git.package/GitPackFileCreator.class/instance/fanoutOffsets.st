accessing
fanoutOffsets
	^ Array streamContents: [ :stream |
		0 to: 255 do: [ :byte || sameOrder |
			sameOrder := self orderedHashes select: [ :integer |
				(integer bitShift: -152) = byte ].
			
			stream nextPut: 
				(sameOrder
					ifEmpty: [ #[0 0 0 0] ]
					ifNotEmpty: [ self hashDict at: sameOrder max ]) ] ]