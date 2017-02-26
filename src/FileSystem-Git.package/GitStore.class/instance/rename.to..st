private
rename: sourcePath to: targetPath
	(self exists: targetPath) ifTrue: [^ nil].
	(self exists: sourcePath) ifFalse: [^ nil].
	self ensure: sourcePath.
	self ensure: targetPath parent.
	cache ensureDirectory: targetPath parent.
	cache rename: sourcePath to: targetPath.
	modManager moveTreeFrom: sourcePath to: targetPath.