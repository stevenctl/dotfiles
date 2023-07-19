extends CSGShape3D
#brief A CSG node that allows you to combine other CSG modifiers.
#desc For complex arrangements of shapes, it is sometimes needed to add structure to your CSG nodes. The CSGCombiner3D node allows you to create this structure. The node encapsulates the result of the CSG operations of its children. In this way, it is possible to do operations on one set of shapes that are children of one CSGCombiner3D node, and a set of separate operations on a second set of shapes that are children of a second CSGCombiner3D node, and then do an operation that takes the two end results as its input to create the final shape.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGCombiner3D





