git porcelain
handleConnectionClosed: aConnectionClosed ifRetry: aBlock
	| preference |
	preference := Preferences
						pragmaPreferenceFor: GitFeatureFlags
						getter: #externalFetchAndPush.
	(self confirm:
		'Pushing failed with the internal git implementation. ' asText,
		'Do you want to try to automatically push using the git commandline? ',
		'This will enable ',
		('a preference' asText
			addAttribute: (PluggableTextAttribute evalBlock: [preference open]);
			yourself),
		' to remember your decision.')
			ifFalse: [aConnectionClosed pass]
			ifTrue: [
				preference preferenceValue: true.
				aBlock value].