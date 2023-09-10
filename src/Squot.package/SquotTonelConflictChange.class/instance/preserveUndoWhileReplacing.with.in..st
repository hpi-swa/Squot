click-handling
preserveUndoWhileReplacing: anInterval with: aText in: aTextEditor
	aTextEditor
		selectIntervalInvisibly: anInterval;
		openTypeIn;
		replace: anInterval with: aText;
		closeTypeIn.