--Question 2: Fix or improve the implementation of the below method

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    print(guildName)
end

--Solution
--  1)  Above query returns all matching guilds but the print implementation
--      assumes only one result. This has been modified below to actually
--      parse through all matching guilds and print them
--
--  2)  Also added safety checks for resultId

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

    --Check for successful query
    if resultId ~= false then
        repeat
            --Retrieve name from row
            local name = result.getString("name")
            print(name)
        until not result.next:(resultId) --Move to next row
        result.free(resultId) --Release resultId from query result set
    end
end
