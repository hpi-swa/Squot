toolbuilder
buildButtons: builder
	^ GSGUIUtilities buildButtons:
		(self buttons collect: [:association |
			self buildButton: association key action: association value with: builder])
		with: builder