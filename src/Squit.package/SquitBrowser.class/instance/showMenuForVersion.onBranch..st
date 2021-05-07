actions on branches
showMenuForVersion: aVersion onBranch: aHistorian
	| builder menu |
	builder := ToolBuilder default.
	menu := builder build: 
		(builder pluggableMenuSpec new
			model: self;
			add: '(Nothing implemented yet)'
			target: self
			selector: #notYetImplemented
			argumentList: (Array with: aVersion with: aHistorian with: self projectSelection);
			yourself).
	builder open: menu.