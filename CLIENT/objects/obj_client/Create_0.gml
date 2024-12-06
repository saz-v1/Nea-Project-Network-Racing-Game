enum network 
{
	player_establish,
	player_connect,
	player_joined,
	player_disconnect,
	move, //= 0 adding others indexing is starting at 0
	chat,
	
}

client = network_create_socket(network_socket_tcp);
connected = network_connect(client, "192.168.0.33", 1000); 
//server port must be same 
//have to use ur own local ip address
//can find in the command prompt by typing  ipconfig
//and it is the ipv4 one
show_message(connected);//verifies we connected
//if we get a number 0 or greater then we have connected
//must run server first or we will get a negative number

client_buffer = buffer_create(10240, buffer_fixed, 1); 
//can send about 4 megabytes of data 

socket_to_instanceid = ds_map_create();
