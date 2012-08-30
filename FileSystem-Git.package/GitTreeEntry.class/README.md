I represent an entry for a child node of a GitTree. I provide additionally information about the object (either another tree or a blob) I reference.

Instance Variables:
	mode	<Integer>
		Octal representation of the type of entry ('chmod' bit settings).
		The mode for newly created objects is either that of 'self fileMode' or 'self dirMode'.
		Loaded entries may have a varying bit sequence because git only pays attention
		to the executable bit.
	objectSignature	<GitObjectSignature>
		The signature of the object referenced.
	entryName	<String>
		'Physical' name of the entry. On a filesystem this would be the name of the
		file or directory.