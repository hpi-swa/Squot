private
outputOr: aBlock
	^ SquotProgressOutput value ifNil: [aBlock]