
--Question 3: Fix or improve the name and the implementation of the below method

function do_sth_with_PlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()
    
    for k,v in pairs(party:getMembers()) do
        if v == Player(membername) then
            party:removeMember(Player(membername))
        end
    end
end

--Solution

--  1)  First the name, clearly we intend to kick a specific member of the
--      party and so the method has been renamed as such
--
--  2)  Moved a lot of the constructor-like table calls to a single variable
--      to reduce overhead
--
--  3) Changed player construction to only be ID based

function kickFromPlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()

    local partyMembers = party:getMembers() --Moving to a variable for brevity

    for k,v in pairs(partyMembers) do
        if v:getName() == membername then
            party:removeMember(v)
        end
    end
end
