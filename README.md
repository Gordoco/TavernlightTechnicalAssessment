# TavernlightTechnicalAssessment
A repo containing the provided answers to the technical interview questions posed by Tavernlight Games

# Question 5

### Reasoning
- For this simple example I just made use of the existing spell and combat frameworks to create the desired effect.

### Overview
- A small change was made to the effect.cpp file in the TFS source code to fix a visual bug with the tornado spawns due to misaligned patterns
> int xPattern = offsetX % getNumPatternX();  
> if (xPattern < 0)  
>     xPattern += getNumPatternX();  
> 
> int yPattern = offsetY % getNumPatternY();  
> if (yPattern < 0)  
>     yPattern += getNumPatternY();  
>   
> //FOR QUESTION 5  
> //--------------------------------  
> //Hacky solution to rendering issue  
> //Mismatch of pattern values causing  
> //tornadoes to be assigned invalid  
> //patterns  
> xPattern = yPattern;
- A new spell was added to the spells.xml file
> \<instant group="attack" name="Icy Tornado Storm" words="frigo" level="1" mana="1" soul="0" premium="0"   
> aggressive="0" selftarget="0" cooldown="2000" groupcooldown="2000" needlearn="0"  
> script="conjuring/ice_tornado_storm.lua">  
> \<vocation name="Sorcerer"/>  
> \<vocation name="Druid"/>  
> \<vocation name="Master Sorcerer"/>  
> \<vocation name="Elder Druid"/>  
> \</instant>  
- Finally the lua code for the spell itself is contained in [ice_tornado_storm.lua](https://github.com/Gordoco/TavernlightTechnicalAssessment/blob/Question-5/ice_tornado_storm.lua)