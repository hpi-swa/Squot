updating
selfUpdate
	"UpdateWorkingCopy := nil"
	UpdateWorkingCopy ifNil: [
		UpdateWorkingCopy := SquotWorkingCopy new.
		UpdateWorkingCopy store: SquotImageStore new.
		UpdateWorkingCopy repository: (
			SquitRepository onDirectory: FileSystem memory / 'Squot').
		UpdateWorkingCopy repository gitRepository
			addRemote: 'origin' url: self selfUpdateRepository].
	UpdateWorkingCopy repository gitRepository fetchFrom: 'origin'.
	UpdateWorkingCopy loadedHistorian: (
		UpdateWorkingCopy repository historianNamed: 'origin/master').
	UpdateWorkingCopy registerPackagesInStore.
	SquotWorkingCopy registered
		detect: [:each | each name includesSubstring: 'Squot' caseSensitive: false]
		"This is likely to be a Squot developer, so interactively load current version"
		ifFound: [UpdateWorkingCopy loadCurrentVersionInteractively]
		ifNone: [
			"Close all instances before updating to avoid any UI glitches"
			SquitBrowser allInstances do: [:each | each changed: #close].
			UpdateWorkingCopy loadVersion: UpdateWorkingCopy baseVersion interactive: false.
			SquitBrowser open]