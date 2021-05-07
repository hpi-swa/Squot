actions on versions
showMenuForVersion: droppedVersion onVersion: targetVersion
	| builder menu |
	builder := ToolBuilder default.
	(self withUnitOfWork: [(self projectSelection repository historianNamed: self branchSelection) = self projectSelection loadedHistorian])
		ifTrue:
			["active branch selected, offer to cherry pick, ignoring the targetVersion"
			menu := builder build:
				(builder pluggableMenuSpec new
					model: self projectSelection;
					add: 'Cherry pick ', droppedVersion printString
					target: self
					selector: #cherryPick:toWorkingCopy:
					argumentList: (Array with: droppedVersion with: self projectSelection);
					yourself)]
		ifFalse:
			[menu := builder build: 
				(builder pluggableMenuSpec new
					model: self;
					add: '(Nothing implemented yet)'
					target: self
					selector: #notYetImplemented
					argumentList: (Array with: droppedVersion with: targetVersion with: self projectSelection);
					yourself)].
	builder open: menu.