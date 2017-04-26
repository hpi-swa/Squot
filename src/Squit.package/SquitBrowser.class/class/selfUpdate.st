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
	SquotWorkingCopy registered
		detect: [:each | each name includesSubstring: 'Squot' caseSensitive: false]
		"This is likely to be a Squot developer, so interactively load current version"
		ifFound: [:selfWorkingCopy | self selfUpdateWithSquot: selfWorkingCopy]
		ifNone: [
			"Close all instances before updating to avoid any UI glitches"
			SquitBrowser allInstances do: [:each | each changed: #close].
			self selfUpdateFromMetacello.
			"UpdateWorkingCopy loadVersion: UpdateWorkingCopy baseVersion interactive: false."
			SquitBrowser open].