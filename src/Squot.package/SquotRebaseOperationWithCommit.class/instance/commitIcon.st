icon
commitIcon
	| color rect |
	^ self cachedIcon: [:canvas |
		rect := canvas clipRect.
		rect := rect insetBy: rect extent / 4.
		color := Color black.
		canvas
			drawImage: self lineIcon at: 0 @ 0;
			fillOval: rect color: Color white;
			frameOval: rect width: 4 color: Color black]