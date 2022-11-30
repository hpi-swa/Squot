layout
listHeightFor: anInteger
	^ [ToolBuilder default listHeightFor: anInteger]
		on: MessageNotUnderstood do: [:e | e return: Preferences standardListFont height * anInteger]