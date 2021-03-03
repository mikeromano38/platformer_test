// H Collisions
if (place_meeting(x + hsp, y, wall_obj)) {
	hsp = -hsp;               
}
x += hsp;