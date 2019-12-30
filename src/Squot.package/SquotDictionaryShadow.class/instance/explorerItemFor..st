*Squot-Tools
explorerItemFor: aDictionarySlot
	^ ObjectExplorerWrapper
		with: aDictionarySlot valueShadow
		name: aDictionarySlot keyShadow printString 
		model: self
	