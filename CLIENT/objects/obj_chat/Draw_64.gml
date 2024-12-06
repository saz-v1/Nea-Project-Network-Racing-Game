draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
for(var i = 0; i < ChatSize; i++) //if chatsize I increments by 1 so we atleast display 5 messages
{
	draw_text(100, 360 - (16*i), ds_list_find_value(global.chat, i))
	//this will draw out our chat
}

if active = true
{
	draw_set_colour(c_red);
	draw_text_transformed(100,400, "> " +chat_text , 2 , 2, 0);
}//when our chat is on the colour will be set to red and will draw out our chat message
else
{
	draw_set_colour(c_black);
	draw_text_transformed(100,400, "> ", 2 , 2, 0);
	//and when the chat is off the colour will be black 
}

	