Squot repository extensions
extension: extensionId ifPresent: presentBlock ifAbsent: absentBlock
	"Reposiotry implementations can provide extensions if the backend supports them.
	Ref. extension object pattern."
	"Default implementation when no extensions are supported."
	^ absentBlock value