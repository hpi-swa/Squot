accessing
terminalCommandForExternalCommands
	<preference: 'Command for spawning a terminal to run external commands' categoryList: #('Git expert settings') description: 'It should contain a pair of curly braces {} where the external command should be inserted. The braces may optionally contain a comma-separated sequence of actions: 1. {quote} quotes the command with single quotes before inserting it, 2. {abc:def} replaces all occurences of abc with def, 3. {no-key} prevents the prompt "Press any key to continue..." from being added after the command. These may be combined, e. g. {quote,":\",quote,sh:zsh}. The actions are executed left-to-right. See FileSystemGitRepository>>knownTerminalCommands for examples.' type: #String>

	^ TerminalCommandForExternalCommands ifNil: ['']