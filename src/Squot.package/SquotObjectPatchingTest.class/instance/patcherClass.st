as yet unclassified
patcherClass
	^ SquotToggles useNewObjectPatching
		ifTrue: [SquotNewObjectPatcher]
		ifFalse: [SquotObjectPatcher]