click-handling
withConflictTextClickHandler: aStringOrText
	^ GSTextUtilities onClick: aStringOrText do: [:model :paragraph :clickPoint :editor |
		self handleConflictTextClickIn: paragraph at: clickPoint with: editor.
		true]