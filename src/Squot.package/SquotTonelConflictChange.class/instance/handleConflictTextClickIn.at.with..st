click-handling
handleConflictTextClickIn: aParagraph at: aPoint with: aTextEditor
	| lineIndex source conflictAssoc conflictInterval resolution |
	lineIndex := aParagraph lineIndexForPoint: aPoint.
	source := aParagraph text asString.
	conflictAssoc := self conflictIntervalAndResolutionSurrounding: lineIndex in: source.
	conflictAssoc ifNil: [^ self inform: 'no appropriate conflict markers found'].
	conflictInterval := conflictAssoc key.
	resolution := conflictAssoc value asText.
	self preserveUndoWhileReplacing: conflictInterval with: resolution in: aTextEditor.