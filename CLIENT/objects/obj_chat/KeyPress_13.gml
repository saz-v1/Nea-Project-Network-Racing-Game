if active = false
{
	active = true //turns the chat on
	keyboard_string = ""; //clear chat text
	chat_text = "";
	//this way it erases the last thing we sent
}
else
{
	active = false //turns the chat off
	buffer_seek(obj_client.client_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.client_buffer, buffer_u8, network.chat);
	buffer_write(obj_client.client_buffer, buffer_string, chat_text); //sends the chat text
	network_send_packet(obj_client.client, obj_client.client_buffer, buffer_tell(obj_client.client_buffer));

}