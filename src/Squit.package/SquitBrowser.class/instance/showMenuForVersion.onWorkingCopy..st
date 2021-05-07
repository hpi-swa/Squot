actions on working copies
showMenuForVersion: aVersion onWorkingCopy: aWorkingCopy
	| builder menu |
	builder := ToolBuilder default.
	menu := builder build: 
		(builder pluggableMenuSpec new
			model: aWorkingCopy;
			add: 'Cherry pick ', (aVersion printStringLimitedTo: 60)
			target: self
			selector: #cherryPick:toWorkingCopy:
			argumentList: (Array with: aVersion with: aWorkingCopy);
			yourself).
	builder open: menu.