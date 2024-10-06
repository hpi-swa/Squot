actions
actionMove
	| newPath |
	self selectedMapperIfNilInformAnd: [^ self].
	newPath := (self activeWorkingCopy
					requestUnmappedPathWithTitle:
						('New path for asset ''{1}'':' format: {self selectedMapper printDescriptionStringWithoutPath})
					initialAnswer: (SquotPathUtilities asString: self selectedMapper path))
						ifNil: [^ self].
	self selectedMapper moveTo: newPath in: self activeWorkingCopy.
	self changed: #selectedAsset. "path changed"