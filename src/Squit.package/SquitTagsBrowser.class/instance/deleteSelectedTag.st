actions
deleteSelectedTag
	repository withUnitOfWork:
		[repository delete: self selectedTagHistorian].
	selectedTagName := nil.
	self changed: #tagLabels.