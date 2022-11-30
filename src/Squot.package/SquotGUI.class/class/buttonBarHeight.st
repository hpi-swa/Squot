layout
buttonBarHeight
	^ [ToolBuilder default buttonRowHeight]
		on: MessageNotUnderstood do: [:e | e return: Preferences standardButtonFont height * 5/2]