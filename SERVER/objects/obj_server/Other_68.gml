type_event = ds_map_find_value(async_load, "type");
//creates a ds map which u can get data from 
switch(type_event)
{
	case network_type_connect:
	    socket = ds_map_find_value(async_load, "socket");
		//so this pulls from the ds map and gets the socket of the client that just connected
		ds_list_add(socket_list, socket);
		buffer_seek(server_buffer, buffer_seek_start, 0);
		buffer_write(server_buffer, buffer_u8, network.player_establish);
		buffer_write(server_buffer, buffer_u8, socket);
		network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
		//this will tel the client that just connected to send data now that it has been connected

		break;
	
	case network_type_disconnect:
	    socket = ds_map_find_value(async_load, "socket");
	    ds_list_delete(socket_list,ds_list_find_index(socket_list, socket));
	    //finds the socket postion and then deletes it from the socket list
	    //this way information isnt sent to clients who no longer exist
	
	
        var i = 0
	    repeat(ds_list_size(socket_list))
	    {
			var _sock = ds_list_find_value(socket_list, i);
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_disconnect);
			buffer_write(server_buffer, buffer_u8, socket);
			network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
		    //this tells all the clients that a player with that socket has disconnected
			
			i++
		}
	
	
		with(ds_map_find_value(socket_to_instanceid,socket))
		{
			instance_destroy();//when the player disconnects we can get the instancneID and destroy it 
		}
		ds_map_delete(socket_to_instanceid, socket); //this is to make sure the ID is deleted from the ds map
		break;
	
	case network_type_data:
		buffer = ds_map_find_value(async_load, "buffer");
		socket = ds_map_find_value(async_load, "id"); 
		//finds the ID of the client who just sent the info
		buffer_seek(buffer,buffer_seek_start,0);
		//goes to the very start of the buffer to make sure it gets the first piece of information
		received_packet(buffer,socket); 
		//goes through list of actions and finds what the player did and transmits that infomration 
		break;
	
}