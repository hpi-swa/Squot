actions
actionSettings
	| builder menu |
	builder := ToolBuilder default.
	menu := builder pluggableMenuSpec new.
	menu
		add: 'Set package storage format'
		target: self selector: #offerPackageFormatMenu argumentList: #();
		add: 'Edit global author information...'
		target: self selector: #editGlobalAuthorInfo argumentList: #();
		add: (self projectSelection shouldStoreMetadata
				ifTrue: ['<yes>']
				ifFalse: ['<no>']), ' Store Squot metadata files'
		target: self selector: #toggleMetadata argumentList: #().
	builder open: menu.