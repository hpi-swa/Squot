accessing
diffText
	^ SquotTextUtilities
		diffFromLines: self oldMapperLines
		toLines: self newMapperLines