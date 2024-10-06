comparing
equals: anObject withMappersConversion: aBlock
	"ignore version"
	^ self class == anObject class
		and: [self name = anObject name]
		and: [(aBlock value: self mappers) = (aBlock value: anObject mappers)]