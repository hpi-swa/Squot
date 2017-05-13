public-accessing
mode
	^ self isSubmodule
		ifTrue: [ self class submoduleMode ]
		ifFalse: [
			self isInFilemode
				ifTrue: [ self class fileMode ]
				ifFalse: [ self class dirMode ]]