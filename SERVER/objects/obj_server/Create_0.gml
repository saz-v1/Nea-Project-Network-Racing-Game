enum network
{
	player_establish,
	player_connect,
	player_joined,
	player_disconnect,
	move,
	chat,
}


port = 1000
MaxClients = 5;
network_create_server(network_socket_tcp, port, MaxClients);
//this sets the server to TCP the other options are WS or UDP
server_buffer = buffer_create(10240,buffer_fixed,1);
//takes the buffer and goes into a packet and sends the packet somewhere
socket_list = ds_list_create();
//socket is the unique ID of a client that has connnected
socket_to_instanceid = ds_map_create();
//server is storing all of the sockets of the player, and based on the socket we can get the instance ID of the player

playerSpawn_x =100;
playerSpawn_y =100;
