formatting
addFont: aFont to: aTextOrString
	^ self addAttribute: (TextFontReference toFont: aFont) to: aTextOrString