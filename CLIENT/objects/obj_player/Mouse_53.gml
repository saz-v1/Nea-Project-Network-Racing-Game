/*buffer_seek(obj_client.client_buffer, buffer_seek_start, 0); //starts checking the actions from the top(0)
buffer_write(obj_client.client_buffer, buffer_u8, network.move); //msgid is 1
buffer_write(obj_client.client_buffer, buffer_u16, mouse_x);
buffer_write(obj_client.client_buffer, buffer_u16, mouse_y);
//u16 is used as u8 = 255 and this is too small for a room
//mouse_x(or Y) = wherever we click our mouse will go there
network_send_packet(obj_client.client, obj_client.client_buffer, buffer_tell(obj_client.client_buffer));
//this will send information to the server
//so we can write or put as much data (up to a megabyte) above the network_send_packet line
