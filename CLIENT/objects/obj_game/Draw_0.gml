if room != rm_main
	exit;
draw_set_halign(fa_center);
draw_set_valign(fa_center); 
//aligns the vertical and horizontal text to 
//the center instead of starting it at the left
draw_text_transformed_colour(room_width / 2, room_height / 3, @"
Press Enter To Connect to the server!", 2, 2, 0, c_black, c_orange, c_black, c_black, 1);