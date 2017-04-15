updating
selfUpdate
	"UpdateWorkingCopy := nil"
	UpdateWorkingCopy ifNil: [
		UpdateWorkingCopy := SquotWorkingCopy new.
		UpdateWorkingCopy store: SquotImageStore new.
		UpdateWorkingCopy repository: (
			SquitRepository onDirectory: FileSystem memory / 'Squot').
		UpdateWorkingCopy repository gitRepository
			addRemote: 'origin' url: self updateRepository].
	UpdateWorkingCopy repository gitRepository fetchFrom: 'origin'.
	UpdateWorkingCopy loadedHistorian: (
		UpdateWorkingCopy repository historianNamed: 'origin/master').
	"UpdateWorkingCopy loadVersion: UpdateWorkingCopy baseVersion interactive: false."
	UpdateWorkingCopy loadCurrentVersionInteractively.