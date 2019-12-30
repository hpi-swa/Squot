*Squot-Tools
explorerContents
	^ slots keysSortedSafely collect:
		[:each | ObjectExplorerWrapper
			with: (slots at: each)
			name: each asString
			model: self]