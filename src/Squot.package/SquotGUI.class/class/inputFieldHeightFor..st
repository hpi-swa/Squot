layout
inputFieldHeightFor: numberOfLines
	^ [ToolBuilder default inputFieldHeightFor: numberOfLines]
		on: MessageNotUnderstood do: [:e | e return: Preferences standardDefaultTextFont height * 3/2 * numberOfLines]