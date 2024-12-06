function network_player_join(){
	var _username = argument0;
	var _player = instance_create_depth(playerSpawn_x, playerSpawn_y, depth, obj_player);
	//creates obj_player in server
	_player.username = _username; //gives player a username
		
		//Add instance id of obj_player to socket map
		ds_map_add(socket_to_instanceid, socket, _player);
		
		#region Creates obj_player for connecting client
		buffer_seek(server_buffer, buffer_seek_start, 0);
	    buffer_write(server_buffer, buffer_u8, network.player_connect);
	    buffer_write(server_buffer, buffer_u8, socket);
	    buffer_write(server_buffer, buffer_u16, _player.x); //this will send the x and y of the player we created in the server
		buffer_write(server_buffer, buffer_u16, _player.y);
		buffer_write(server_buffer, buffer_string, _player.username);
	    network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
		#endregion
		
		#region Sends already joined clients to connecting client
		var i = 0;
		repeat(ds_list_size(socket_list))
		{
			var _sock = ds_list_find_value(socket_list, i);
			if _sock != socket
			{
				var _player2 = ds_map_find_value(socket_to_instanceid, _sock);
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.player_joined);
				buffer_write(server_buffer, buffer_u8, _sock);
				buffer_write(server_buffer, buffer_u16, _player2.x);
				buffer_write(server_buffer, buffer_u16, _player2.y);
				buffer_write(server_buffer, buffer_string, _player2.username);
				//this will send the x and y of the player we created in the server
				network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
				//this will send the other players actions to the other client
				//creates a player2 object instead of an object player
				}
				i+=1;
			}
			#endregion
			
			#region Send clients already in game, the client that just joined
			var i = 0;
			repeat(ds_list_size(socket_list))
			{
				var _sock = ds_list_find_value(socket_list,i);
				if _sock != socket
				{
					buffer_seek(server_buffer,buffer_seek_start,0);
					buffer_write(server_buffer,buffer_u8,network.player_joined);
					buffer_write(server_buffer,buffer_u8,socket);
					buffer_write(server_buffer,buffer_u16,_player.x);
					buffer_write(server_buffer,buffer_u16,_player.y);
					buffer_write(server_buffer,buffer_string,_player.username);
					network_send_packet(_sock,server_buffer,buffer_tell(server_buffer));
		        }
				i+=1;
			}
			#endregion
			

}