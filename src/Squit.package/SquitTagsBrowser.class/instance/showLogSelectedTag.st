actions
showLogSelectedTag
	| historian browser project |
	selectedTagName ifNil: [^ self errorNoTagSelected].
	repository withUnitOfWork:
		[historian := self selectedTagHistorian.
		browser := SquitBrowser new.
		project := self findProjectWith: browser.
		project ifNil: [^ self errorNoProjectFound].
		browser projectSelection: project;
			selectedHistorian: historian.
		ToolBuilder default open: browser].