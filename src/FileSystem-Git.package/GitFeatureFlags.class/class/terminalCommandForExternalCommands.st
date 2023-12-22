accessing
terminalCommandForExternalCommands
	<preference: 'Command for spawning a terminal to run external commands' categoryList: #('Git expert settings') description: 'It should accept the external command and its arguments after the string you provide.' type: #String>

	^ TerminalCommandForExternalCommands ifNil: ['']