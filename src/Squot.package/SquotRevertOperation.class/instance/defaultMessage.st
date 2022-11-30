accessing
defaultMessage
	^ 'Revert "{1}"

This reverts {2}' format:
	{revertedVersion message withSqueakLineEndings copyUpTo: Character cr.
	revertedVersion}