
//Question 4: Assume all method calls work fine. Fix the memory leak issue in below method

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}

//Solution

//  1)  The memory leak revolves around line 8 (above) and all the cases where that player pointer
//      exists. Details of the solution are commented directly below

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    //Initializes player from internal pointer map, assuming freeing this locally would be bad
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        //Initializing new player object which will need freeing
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            //Loading failed, freeing initialized player object
            free(player);
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        //item is null, no need to free
        return;
    }

    //item pointer is needed and is eventually destroyed/freed here
    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
        //If player is offline, means line 36-37 was executed
        //and this player pointer needs freeing
        free(player)
    }
    //Don't free player here, potentially still online
}
