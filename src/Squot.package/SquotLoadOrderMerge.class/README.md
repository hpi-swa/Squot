Holds the state of the merge of three load orders. Their resolution also depends on the resolution of container conflicts in the overall object container merge.

Load order is a simplification of dependencies among artifacts. The order #(a b c) implies: a must be loaded before b, b must be loaded before c (regardless of whether that is actually required or not). Since each artifact appears only once in the order, two artifacts cannot mutually depend on each other according to this simplification. Also note that not changing something is not considered worth preserving during a merge. As a consequence, there can be no conflicts in load orders if nothing is added: for any given pair of artifacts a and b where a comes before b in the merge base, either one of the working copy or the incoming changes still lists a before b, so the change from the other side takes effect, or both now list b before a, and they are are thus in agreement about the order.

The only possible conflicts arise if an artifact is added in different places by both sides: if x is added to order #(a b) one time as #(a b x) and the other time as #(a x b), then one implies that x depends on b and the other implies that b depends on x. It is not possible to satisfy both constraints at the same time, so the merged order must be resolved by outside intervention.

Removals do not imply new dependencies, so they cannot result in conflicts.

Example merge:
Original order: Squot Squit Tonel Baseline.
Working copy order: Squot Tonel Squit Baseline. (Tonel does not depend on Squit.)
Incoming order: Baseline Squot Squit Tonel. (Baseline depends on nothing.)
Acceptable solution: Baseline Squot Tonel Squit.

Graph algorithm O(n²) (after additions and removals have been applied):
Initialize weighted directed graph with nodes. O(n)
Increase edges from working and incoming orders. O(n²)
	(Squot->Tonel. Squot->Squit. Squot->Baseline. Tonel->Squit. Tonel->Baseline. Squit->Baseline.
	Baseline->Squot. Baseline->Squit. Baseline->Tonel. Squot->Squit(2). Squot->Tonel(2). Squit->Tonel).
Decrease all edges implied by the original order O(n²):
	-Squot->Squit. -Squot->Tonel. -Squot->Baseline. -Squit->Tonel. -Squit->Baseline. -Tonel->Baseline.
That leaves: (Squot->Tonel(1). Squot->Squit(1). Tonel->Squit. Baseline->Squot. Baseline->Squit. Baseline->Tonel). The pair orders that are present in all three orders are still in the graph (here: Squot->Tonel. Squot->Squot).
Graph is acyclic again as concluded above: swapped dependencies (that produce cycles) are either agreed upon (inverse edge not in the graph before the remove step) or the original direction appears just with weight 1 and would be removed later. If both sides agreed on a new dependency, its edge will still have weight 2 in the graph now.
Find a topological order using depth first search O(n²) (since number of edges is in O(n²)):
	Start with Squot (any node).
	 Visit Tonel.
	  Visit Squit. No outgoing edges from Squit, put in list.
	  (If an edge had degree 2, the edge would not need to be visited multiple times because the target node is already on the list.)
	  No more outgoing edges from Tonel, put in list.
	 Visit Squit, already in list.
	 No more outgoing edges from Squot, put in list.
	Continue with Tonel, already in list.
	Continue with Squit, already in list.
	Continue with Baseline.
	 Visit Squot, already in list.
	 Visit Squit, already in list.
	 Visit Tonel, already in list.
	 No more outgoing edges from Baseline, put in list.
List is now Squit Tonel Squot Baseline.
Reverse list. O(n)
--> Baseline Squot Tonel Squit.

Pair check algorithm O(n³)  (after additions and removals have been applied):
Check dependencies for each pair O(n*n others*n lookup) = O(n³):
	 Squot still comes before Tonel on both sides.
	  Squot still comes before Squit on both sides.
	  Baseline now comes before Squot (unlike in the base).
	 Tonel now comes before Squit (unlike in the base).
	  Baseline now comes before Tonel (unlike in the base).
	 Baseline now comes before Squit (unlike in the base).
Put elements in new order O(n*(n find place + n moves)) = O(n²):
	Pick Squot.
	Pick Tonel and put it behind last element (Squot).
	Pick Squit put it behind last element (Tonel).
	Pick Baseline,
	 comes before last element (Squit)
	 comes before previous element (Tonel)
	 comes before previous element (Squot)
	 (if there were any element before that, compare with that and possibly put after it)
	 no more previous elements, put at start.
--> Baseline Squot Tonel Squit.