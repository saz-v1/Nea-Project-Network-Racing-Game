# Multiplayer Network Racing Game

A 2D retro-style top-down multiplayer racing game. The game allows multiple players to connect to a server, race in real-time, set usernames, and communicate via an integrated chatbox.

## Features

### Gameplay
- **Multiplayer Racing**: Players can join a shared server to race against each other.
- **Chat System**: Real-time messaging between players.
- **Custom Usernames**: Displayed above each player's car in the game.

### Design
- **Retro Arcade Aesthetic**: Minimalistic 2D sprites and backgrounds for a classic feel.
- **Interactive UI**: Intuitive menus, player prompts, and chatbox interaction.
- **Track Design**: Simple, engaging tracks for competitive racing.

### Networking
- **Client-Server Architecture**: Supports up to 5 players simultaneously.
- **Synchronization**: Player positions and messages are updated in real-time.
- **Scalable Design**: Easy to expand with additional features.

### Development Tools
- **Game Engine**: [GameMaker Studio 2](https://www.yoyogames.com/en/gamemaker).
- **Programming Language**: GML (GameMaker Language).
- **Resources**: GameMaker manual, online tutorials, and forums.

## Installation and Setup

### Prerequisites
- [GameMaker Studio 2](https://www.yoyogames.com/en/gamemaker) installed on your system.

### Files Included
1. **Server Project**: `SERVER.yyp`
2. **Client Project**: `CLIENT.yyp`

### Running the Game
1. Open the `SERVER.yyp` file in GameMaker Studio 2.
2. Run the server project to start hosting.
3. Open the `CLIENT.yyp` file in GameMaker Studio 2 for each client.
4. Enter a unique username and connect to the server's IP and port.
5. Begin the game and enjoy real-time multiplayer racing!

## Controls

- **Movement**: Mouse clicks (alternate controls can be implemented, such as arrow keys or WASD).
- **Chat**: Press `Enter` to toggle chat. Type your message and press `Enter` to send.

## Known Issues and Limitations
- **Movement**: Initially designed for arrow key control, now simplified to mouse clicks to support multiplayer.
- **Score System**: Currently not implemented.
- **Maximum Players**: Limited to 5 concurrent connections.
- **Highscore Table**: Planned for future updates.

## Future Improvements
- Implement a highscore system with a leaderboard.
- Add a scoring mechanism and game win conditions.
- Restore arrow/WASD key controls for racing.
- Enhance graphics and include background music.

## Feedback and Contributions
Feel free to open issues or pull requests to suggest improvements or contribute to the project.

### Acknowledgments
- [GameMaker Studio 2 Manual](https://manual.yoyogames.com/)
- Tutorials from the GameMaker community and YouTube channels.
- Feedback from family and peers during development.