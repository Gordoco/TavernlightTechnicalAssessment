# TavernlightTechnicalAssessment
A repo containing the provided answers to the technical interview questions posed by Tavernlight Games

# Question 7

### Reasoning
- I created a new client-side module to contain what I've labelled "JumpGame" as per the question 7 video. Then I used the game_interface module implementation to initialize JumpGame from user input

### Overview
- The client_jumpgame module is loaded via [client.otmod](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-7/client.otmod)
- JumpGame is launched via the "J" key in [gameinterface.lua](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-7/gameinterface.lua)
- [jumpgame.otmod](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-7/jumpgame.otmod) and [jumpgame.otui](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-7/jumpgame.otui) exist to setup the module and layout the UI respectively
- Finally [jumpgame.lua](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-7/jumpgame.lua) handles the actual functionality
