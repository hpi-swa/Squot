ui
labelString
	| label |
	label := self class defaultTitle.
	self projectSelection ifNotNil: [:project |
		label := label, ': ', project.
		self branchSelection ifNotNil: [:branch |
			label := label, ' (', branch, ')']].
	^ label