ui diff tree
from: leftContainer to: rightContainer
	artifactDiffs := (rightContainer patchRelativeToBase: leftContainer) diffs.