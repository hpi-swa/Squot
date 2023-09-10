click-handling
conflictIntervalAndResolutionSurrounding: lineIndex in: source
	| conflictStart resolutionStart resolutionEnd currentLineIndex |
	conflictStart := nil.
	resolutionStart := nil.
	resolutionEnd := nil.
	currentLineIndex := 0.
	source lineIndicesDo: [:startIndex :endIndexWithoutDelimiter :endIndexWithDelimiter |
		| line previousLineEnd nextLineStart |
		currentLineIndex := currentLineIndex + 1.
		(lineIndex < currentLineIndex and: [conflictStart isNil]) ifTrue: [^ nil].
		previousLineEnd := startIndex - 1.
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
				conflictEnd := endIndexWithDelimiter.
				resolutionEnd ifNil: [resolutionEnd := previousLineEnd].
				conflictInterval := Interval from: conflictStart to: conflictEnd.
				resolution := source copyFrom: resolutionStart to: resolutionEnd.
				^ conflictInterval -> resolution].
			conflictStart := nil.
			resolutionStart := nil.
			resolutionEnd := nil].
		].
	^ nil