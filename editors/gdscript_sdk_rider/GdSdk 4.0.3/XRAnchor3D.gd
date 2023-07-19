extends XRNode3D
#brief An anchor point in AR space.
#desc The [XRAnchor3D] point is a spatial node that maps a real world location identified by the AR platform to a position within the game world. For example, as long as plane detection in ARKit is on, ARKit will identify and update the position of planes (tables, floors, etc) and create anchors for them.
#desc This node is mapped to one of the anchors through its unique ID. When you receive a signal that a new anchor is available, you should add this node to your scene for that anchor. You can predefine nodes and set the ID; the nodes will simply remain on 0,0,0 until a plane is recognized.
#desc Keep in mind that, as long as plane detection is enabled, the size, placing and orientation of an anchor will be updated as the detection logic learns more about the real world out there especially if only part of the surface is in view.
class_name XRAnchor3D




#desc Returns a plane aligned with our anchor; handy for intersection testing.
func get_plane() -> Plane:
	pass;

#desc Returns the estimated size of the plane that was detected. Say when the anchor relates to a table in the real world, this is the estimated size of the surface of that table.
func get_size() -> Vector3:
	pass;


