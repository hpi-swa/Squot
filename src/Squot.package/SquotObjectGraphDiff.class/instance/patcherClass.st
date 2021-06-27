Squot-diff-patching
patcherClass
	^ SquotToggles useNewObjectPatching
		ifTrue: [SquotNewObjectPatcher]
		ifFalse: [SquotObjectPatcher]