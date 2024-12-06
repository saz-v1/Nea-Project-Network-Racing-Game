function received_packet(){
	buffer = argument0;
	msgid = buffer_read(buffer, buffer_u8);
	
	switch(msgid)
	{
		case network.player_establish:
		var _socket = buffer_read(buffer, buffer_u8);
		global.mysocket = _socket;
		//by making it a global variable the socket of the client is 
		//just in the game already
		buffer_seek(client_buffer, buffer_seek_start, 0); //starts checking the actions from the top(0)
		buffer_write(client_buffer, buffer_u8, network.player_establish); //msgid is 1
		buffer_write(client_buffer, buffer_string, obj_game.username);
		//using buffer_string as we just need the string and con_game.username gets th euser variable from con_game
		network_send_packet(client,client_buffer, buffer_tell(client_buffer));

		break;
		
		
		case network.player_connect:
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			var _username = buffer_read(buffer, buffer_string);
		
		
			var _player = instance_create_depth(_x,_y,depth, obj_player);
			_player.socket = _socket; //allows us to find a player with a certain socket
			_player.username = _username;
		
		ds_map_add(socket_to_instanceid, _socket, _player);
		break;
		
		case network.player_joined:
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			var _username = buffer_read(buffer, buffer_string);
		
			var _player2 = instance_create_depth(_x,_y,depth, obj_player2); 
			//obj_player has been changed to obj_player2
			_player2.socket = _socket;
			_player2.username = _username;
			
			ds_map_add(socket_to_instanceid, _socket, _player2);
			break;
		
		case network.player_disconnect:
		var _socket = buffer_read(buffer, buffer_u8);
		var _player = ds_map_find_value(socket_to_instanceid, _socket);
		//instance ID of the player who is disconnecting
		with (_player)
		{
			instance_destroy();
		}
		
		ds_map_delete(socket_to_instanceid, _socket);
		
		break;
		
		
		case network.move: //since it is only being sent the message ID all taht will happen is the image index change
		var _sock = buffer_read(buffer,buffer_u8);
		var move_x = buffer_read(buffer, buffer_u16);
		var move_y = buffer_read(buffer, buffer_u16);
		var move_image_angle = buffer_read(buffer,buffer_u16);
		var move_direction = buffer_read(buffer,buffer_u16);
		
		var _player = ds_map_find_value(socket_to_instanceid, _sock);
		//player could be player2 or player, its whoever the socket is
		
		_player.x = move_x;
		_player.y = move_y;
		_player.image_angle = move_image_angle;
		_player.direction = move_direction;
		
		
		//this will move our object player to where it needs to be
		break;
		
		case network.chat:
			var _chat = buffer_read(buffer, buffer_string);
			//recieves the chat on the client end 
			ds_list_insert(global.chat,0, _chat);
			//this will insert the new chat at the very beginning of the list
			
			break;
	}
}