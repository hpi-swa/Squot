private
validateReferenceOrReferenceName: refPathOrName

	| refName |
	refName := refPathOrName isString 
		ifTrue: [refPathOrName first = $/ 
					ifTrue: [((refPathOrName asReference relativeTo: self baseDir)
								printWithDelimiter: $/)]
					ifFalse: [refPathOrName]]
		ifFalse: [((refPathOrName relativeTo: self baseDir) printWithDelimiter: $/)].

	^ GitReference validateReferenceName: refName