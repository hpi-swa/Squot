tests
installDuring: aBlock
	| oldToolSet |
	oldToolSet := ToolSet defaultOrNil.
	ToolSet default: self.
	[aBlock
		on: UnhandledError, Halt do:
			[:e | ToolSet default: oldToolSet. e pass]]
		ensure:
			[ToolSet default: oldToolSet;
				unregister: self]