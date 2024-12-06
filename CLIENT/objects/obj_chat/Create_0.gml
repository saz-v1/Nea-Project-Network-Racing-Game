global.chat = ds_list_create();
global.chat_colour = ds_list_create();
ds_list_add(global.chat, "hello",  "",  "",  "",  "");
//this is so that we start with 5 empty things and do not get a possible error 
active = false ; 
//on and off switch so we can choose when chat is active
ChatSize =5; //how many messages should be displayed
chat_text = ""; //chat message
