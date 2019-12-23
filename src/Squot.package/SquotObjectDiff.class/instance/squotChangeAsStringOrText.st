*Squot-Tools
squotChangeAsStringOrText
	^ Text streamContents: [:stream |
		(slotChanges associations groupBy: [:each | each slotShadowType])
			keysAndValuesDo: [:type :slotDiffs |
				stream withAttribute: TextEmphasis italic do:
					[type printHeadlineForChangesTextOn: stream]; cr.
				slotDiffs do: [:each | stream nextPutAll: each hierarchicalDiffTitle; cr].
				stream cr]]