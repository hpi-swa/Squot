patching
rebaseOn: anObjectContainer
	"This diff shall be applied to a different base. Answer a copy with the new base."
	^ self class of: (anObjectContainer artifactAt: self path)