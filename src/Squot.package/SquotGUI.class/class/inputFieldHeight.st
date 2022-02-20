layout
inputFieldHeight
	^ [ToolBuilder default inputFieldHeight]
		on: MessageNotUnderstood do: [:e | e return: Preferences standardDefaultTextFont height * 3/2]