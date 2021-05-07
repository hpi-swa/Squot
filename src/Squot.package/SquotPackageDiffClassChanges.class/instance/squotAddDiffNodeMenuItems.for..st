accessing
squotAddDiffNodeMenuItems: aMenu for: aSquotChangesChooser
	self isCurrentlyIgnoredInSquot
		ifTrue: [aSquotChangesChooser addUnignoreMenuItem: aMenu]
		ifFalse: [aSquotChangesChooser addIgnoreMenuItem: aMenu]