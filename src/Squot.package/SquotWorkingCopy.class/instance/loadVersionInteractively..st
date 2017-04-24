loading and unloading
loadVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion.
	Answer true if the load was accepted, false if it was canceled."
	| snapshot |
	self flag: #optimize. "work with diffs, not whole snapshots"
	[snapshot := aVersion snapshot]
		on: SquotNoTableOfContentsFound do: [:e |
			(self packageDirectoriesIn: e rootDirectory) do:
				[:each | self addPackageInfoForDirectory: each at: (each relativeTo: e rootDirectory)].
			e pass].
	^ self loadSnapshotInteractively: snapshot