// Get input
kLeft = -keyboard_check(ord("A")); // -1 if the A key is pressed, 0 otherwise
kRight = keyboard_check(ord("D")); // 1 if the D key is pressed, 0 otherwise
kJump = keyboard_check_pressed(vk_space); // 1 if space bar pressed, 0 otherwise

onPlatform = place_meeting(x, y + 1, wall_obj);

move = kLeft + kRight; // will return -1, 0, or 1 to set the h direction
hsp = move * moveSpeed; // sets the movement speed in the h direction

if (vsp < 10) {
	vsp += grav; // applies gravity if the player is not at the bottom of the screen
}; 

// Implements double jump
if (onPlatform) {
	vsp = kJump * -jumpSpeed // initiates jump
}

// Fatal enemy collisions
           if (place_meeting(x + hsp, y + vsp, enemy_fatal_base_obj)) {
	room_restart();
}
            
// H Collisions
if (place_meeting(x + hsp, y, wall_obj)) {
	while (!place_meeting(x + sign(hsp), y, wall_obj)) {
		// Start moving the player towards from the h collision 1px at a time
		// until it is 1px away so that we don't overlap the other object
		x += sign(hsp);
	}
	hsp = 0;               
}
x += hsp;

// v Collisions
if (place_meeting(x, y + vsp, wall_obj)) {
	while (!place_meeting(x, y + sign(vsp), wall_obj)) {
		// Start moving the player away from the y collision 1px at a time
		// until it is 1px away so that we don't overlap the other object
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

if (y > room_height) room_restart();
