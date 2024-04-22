git porcelain
handleConnectionClosed: aConnectionClosed whileTryingTo: aString ifRetry: aBlock
	| preference |
	preference := Preferences
						pragmaPreferenceFor: GitFeatureFlags
						getter: #externalFetchAndPush.
	(self confirm:
		('{1}ing failed with the internal git implementation. ' asText,
		'Do you want to try to automatically {2} using the git commandline? ',
		'This will enable ',
		('a preference' asText
			addAttribute: (PluggableTextAttribute evalBlock: [preference open]);
			yourself),
		' to remember your decision.' format: {aString capitalized. aString}))
			ifFalse: [aConnectionClosed pass]
			ifTrue: [
				preference preferenceValue: true.
				aBlock value].