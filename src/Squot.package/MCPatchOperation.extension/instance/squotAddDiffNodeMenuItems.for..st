*Squot-Tools-Diffs
squotAddDiffNodeMenuItems: aMenu for: aSquotChangesChooser
	self definition isOrganizationDefinition "ignoring not implemented yet for organization"
		ifFalse:
			[self isCurrentlyIgnoredInSquot
				ifTrue: [aSquotChangesChooser addUnignoreMenuItem: aMenu]
				ifFalse: [aSquotChangesChooser addIgnoreMenuItem: aMenu]]