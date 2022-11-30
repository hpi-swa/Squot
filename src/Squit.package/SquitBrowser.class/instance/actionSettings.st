actions
actionSettings
	| builder menu |
	builder := ToolBuilder default.
	menu := builder pluggableMenuSpec new.
	self projectSelection ifNotNil:
		[:project |
		menu
			add: 'Set package storage format'
			target: self selector: #offerPackageFormatMenu argumentList: #().
		project addUserSettingsTo: menu].
	menu
		add: 'Edit global author information...'
		target: self selector: #editGlobalAuthorInfo argumentList: #().
	self projectSelection ifNotNil:
		[:project |
		menu
			add: (project shouldStoreMetadata
					ifTrue: ['<yes>']
					ifFalse: ['<no>']), ' Store Squot metadata files'
			target: self selector: #toggleMetadata argumentList: #()].
	builder open: menu.