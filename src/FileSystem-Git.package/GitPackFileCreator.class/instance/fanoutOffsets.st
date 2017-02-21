accessing
fanoutOffsets
	^ Array streamContents: [ :stream || reader |
		reader := self sortedHashes readStream.
		0 to: 255 do: [ :byte |
			[ reader atEnd not
			and: [ (reader peek bitShift: -152) = byte ] ] whileTrue: [ reader next ].
		
			stream nextPut: (reader position asByteArrayOfSize: 4) ] ]