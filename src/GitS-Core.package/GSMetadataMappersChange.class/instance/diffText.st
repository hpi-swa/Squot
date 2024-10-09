accessing
diffText
	^ GSTextUtilities
		diffFromLines: self oldMapperLines
		toLines: self newMapperLines