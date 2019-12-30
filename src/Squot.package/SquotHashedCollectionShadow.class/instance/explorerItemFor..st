*Squot-Tools
explorerItemFor: anItemSlot
	^ ObjectExplorerWrapper
		with: anItemSlot
		name: anItemSlot asString
		model: self