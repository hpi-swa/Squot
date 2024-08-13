click-handling
withConflictTextClickHandler: aStringOrText
	^ SquotTextUtilities onClick: aStringOrText do: [:model :paragraph :clickPoint :editor |
		self handleConflictTextClickIn: paragraph at: clickPoint with: editor.
		true]