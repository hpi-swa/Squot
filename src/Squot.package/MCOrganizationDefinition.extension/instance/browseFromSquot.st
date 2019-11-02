*Squot-tools
browseFromSquot
	^ self categories
		ifNotEmpty:
			[(ToolSet default respondsTo: #browseSystemCategory:)
				ifTrue: [ToolSet default browseSystemCategory: self categories anyOne]
				ifFalse: [Browser new
							selectSystemCategory: self categories anyOne;
							buildAndOpenFullBrowser]]
		ifEmpty: [self inform: 'Nothing to be browsed since there are no categories.']