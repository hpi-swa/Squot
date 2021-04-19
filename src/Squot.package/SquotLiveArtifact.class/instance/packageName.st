converting
packageName
	^ [object packageName] on: MessageNotUnderstood do: [:e | self error: 'Not a package']