private switching historians
cherryPickTemporaryVersion: aVersion
	self assert: aVersion parents size = 1
		description: 'Temporary version must have exactly one parent to restore'.
	self restoreCurrentAncestryAfter:
		[self mergeSilently: aVersion basedOn: aVersion parents first
			onConflictsDo:
				[:merge | | repeat |
				self flag: #duplication. "with switchAndMoveUnsavedChangesOverTo:"
				[repeat := false.
				self selectFromMerge: merge
					title: 'Merge conflicts with stashed changes on branch'
					ifCancelled:
						[(self confirm: 'Discard stashed changes of the branch?')
							ifTrue: [^ self]
							ifFalse: [repeat := false]]]
					doWhileTrue: [repeat]]].