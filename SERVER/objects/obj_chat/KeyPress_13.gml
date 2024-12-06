if active = false
{
	active = true //turns the chat on
	keyboard_string = ""; //clear chat text
	chat_text = "";
	//this way it erases the last thing we sent
}
else
{
	active = false
	//turns the chat off
	
	chat_text = "SERVER: " +chat_text;
	ds_list_insert(global.chat, 0, chat_text);
	
	
	var i = 0;
	repeat(ds_list_size(obj_server.socket_list)) //send data to client
	{
		var _sock = ds_list_find_value(obj_server.socket_list, i);
		
		buffer_seek(obj_server.server_buffer, buffer_seek_start, 0);
		buffer_write(obj_server.server_buffer,buffer_u8, network.chat);
		buffer_write(obj_server.server_buffer,buffer_string,chat_text);
		//this will show the chat_text in the server 
		network_send_packet(_sock,obj_server.server_buffer, buffer_tell(obj_server.server_buffer));
		i++;
	}

}