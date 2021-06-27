patching
patcherClass
	^ SquotToggles useNewObjectPatching
		ifTrue: [SquotNewObjectPatcher]
		ifFalse: [SquotObjectPatcher]