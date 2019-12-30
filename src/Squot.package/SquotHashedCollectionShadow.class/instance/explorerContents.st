*Squot-Tools
explorerContents
	^ super explorerContents,
		itemSlots collect: [:each | self explorerItemFor: each]