function received_packet(){
	buffer = argument0;
	socket = argument1;
	msgid = buffer_read(buffer, buffer_u8);//msgid = message ID
	
	switch(msgid) 
	{
		case network.player_establish:
		var _username = buffer_read(buffer, buffer_string); 
		//this will get the username from the client
		network_player_join(_username); //sends this variable to network_player_join
		break;
		
		case network.move:
		    var move_x = buffer_read(buffer,buffer_u16);
			var move_y = buffer_read(buffer,buffer_u16);
			var move_image_angle = buffer_read(buffer,buffer_u16);
			var move_direction = buffer_read(buffer,buffer_u16);
			
			var _player = ds_map_find_value(socket_to_instanceid, socket);
			_player.x = move_x;
			_player.y = move_y; //should move the object in the server for the object with the clients socket ID
			//should move the object in the server for the object with the clients socket ID
			_player.image_angle = move_image_angle;
			_player.direction = move_direction;
			
			
			var i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list, i);
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer,buffer_u8, network.move);
				buffer_write(server_buffer, buffer_u8, socket); //socket of the player thats moving
				buffer_write(server_buffer,buffer_u16,move_x);
				buffer_write(server_buffer,buffer_u16,move_y);
				buffer_write(server_buffer,buffer_u16,move_image_angle);
				buffer_write(server_buffer,buffer_u16,move_direction);
				//now that we are sending the data right back to the client we will now see it actually work
				network_send_packet(_sock,server_buffer, buffer_tell(server_buffer));
				//client is sending the message and server  is sending it right back
				i++;
			}
			break;
			
			case network.chat:
				var _chat = buffer_read(buffer, buffer_string); //server recieves the chat text
				var _player =ds_map_find_value(socket_to_instanceid, socket) 
				//finds the instance ID of the user who sends the chat
				_chat = _player.username+": " + _chat; //this will add the username of the player to the string chat
				
				ds_list_insert(global.chat, 0, _chat);
				//0 means position 0
				//this will make it so that the server can now see the incoming chat messages as tis been added to our ds list
				
				var i = 0;
				repeat(ds_list_size(socket_list))
				{
					var _sock = ds_list_find_value(socket_list, i);
				
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer,buffer_u8, network.chat);
					buffer_write(server_buffer,buffer_string,_chat);
					//sends the chat/string back to the other clients
					network_send_packet(_sock,server_buffer, buffer_tell(server_buffer));
					i++;
				}
					break;
	}
				
}