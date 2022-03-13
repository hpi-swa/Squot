updating
update: selector
	selector == #historians ifTrue:
		[self changed: #tagLabels.
		(tagLabels includes: selectedTagName) ifFalse: [self selectedTagName: nil]].