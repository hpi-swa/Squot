*Squot-Tools-Diffs
squotAddDiffNodeMenuItems: aMenu for: aSquotChangesChooser
	self isCurrentlyIgnoredInSquot
		ifTrue: [aSquotChangesChooser addUnignoreMenuItem: aMenu]
		ifFalse: [aSquotChangesChooser addIgnoreMenuItem: aMenu]