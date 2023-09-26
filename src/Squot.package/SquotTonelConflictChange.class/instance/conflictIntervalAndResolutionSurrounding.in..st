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
			lineIndex <= currentLineIndex ifTrue: [ | conflictEnd conflictInterval resolution newLine |
				conflictStart ifNil: [^ nil].
				self assert: (conflictStart notNil and: [resolutionStart notNil]).
				conflictEnd := endIndexWithDelimiter.
				resolutionEnd ifNil: [resolutionEnd := previousLineEnd].
				conflictInterval := Interval from: conflictStart to: conflictEnd.
				resolution := source copyFrom: resolutionStart to: resolutionEnd.
				"resolution is missing a new line at the end. Add it from the conflictMarkerRight line, if there is one."
				newLine := source copyFrom: endIndexWithoutDelimiter + 1 to: endIndexWithDelimiter.
				resolution := resolution, newLine.
				^ conflictInterval -> resolution].
			conflictStart := nil.
			resolutionStart := nil.
			resolutionEnd := nil].
		previousLineEnd := endIndexWithoutDelimiter].
	^ nil