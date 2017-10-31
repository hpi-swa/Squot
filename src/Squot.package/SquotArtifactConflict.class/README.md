I represent the conflict of two artifact diffs (e.g. a removal and a change) during a merge.

In contrast to my superclass, my instance variables left and right do not contain editions of artifacts, but artifact diffs instead. Clients are advised to use the leftDiff and rightDiff accessors for that reason.

The conflict can be resolved by sending chooseLeft or chooseRight to me.