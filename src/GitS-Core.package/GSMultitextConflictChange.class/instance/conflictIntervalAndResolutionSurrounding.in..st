click-handling
conflictIntervalAndResolutionSurrounding: lineIndex in: source
	| conflictStart resolutionStart resolutionEnd previousLineEnd currentLineIndex |
	conflictStart := nil.
	resolutionStart := nil.
	resolutionEnd := nil.
	previousLineEnd := nil.
	currentLineIndex := 0.
	source lineIndicesDo: [:startIndex :endIndexWithoutDelimiter :endIndexWithDelimiter |
		| line nextLineStart |
		currentLineIndex := currentLineIndex + 1.
		(lineIndex < currentLineIndex and: [conflictStart isNil]) ifTrue: [^ nil].
		nextLineStart := endIndexWithDelimiter + 1.
		line := source copyFrom: startIndex to: endIndexWithDelimiter.
		(line beginsWith: self conflictMarkerLeft) ifTrue: [
			conflictStart := startIndex.
			resolutionStart := nextLineStart].
		(line beginsWith: self conflictMarkerBase) ifTrue: [
			lineIndex >= currentLineIndex
				ifTrue: [resolutionStart := nextLineStart]
				ifFalse: [resolutionEnd ifNil: [resolutionEnd := previousLineEnd]]].
		(line beginsWith: self conflictMarkerSeparator) ifTrue: [
			lineIndex > currentLineIndex "> because a click on the separator should resolve to the base"
				ifTrue: [resolutionStart := nextLineStart]
				ifFalse: [resolutionEnd ifNil: [resolutionEnd := previousLineEnd]]].
		(line beginsWith: self conflictMarkerRight) ifTrue: [
			lineIndex <= currentLineIndex ifTrue: [ | conflictEnd conflictInterval resolution |
				conflictStart ifNil: [^ nil].
				self assert: (conflictStart notNil and: [resolutionStart notNil]).
				conflictEnd := endIndexWithoutDelimiter.
				resolutionEnd ifNil: [resolutionEnd := previousLineEnd].
				resolution := resolutionStart - 1 <= resolutionEnd "- 1 to allow for a single empty line"
								ifTrue: [source copyFrom: resolutionStart to: resolutionEnd]
								"if there is no line, remove the line end after the conflict, too"
								ifFalse: [conflictEnd := endIndexWithDelimiter. ''].
				conflictInterval := Interval from: conflictStart to: conflictEnd.
				^ conflictInterval -> resolution].
			conflictStart := nil.
			resolutionStart := nil.
			resolutionEnd := nil].
		previousLineEnd := endIndexWithoutDelimiter].
	^ nil