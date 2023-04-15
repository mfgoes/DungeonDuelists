/// @desc creates new decks
function deck_construct_lvl1() {
    opponent_card_set[0] = new Monster_weak(); // Tofu Troll
    opponent_card_set[1] = new Monster_weak(); // Tofu Troll
    opponent_card_set[2] = new Monster_weak(); // Tofu Troll
    opponent_card_set[3] = new Monster_weak(); // Tofu Troll
    opponent_card_set[4] = new Monster_2_2();  // Twiggy Forager
    opponent_card_set[5] = new Monster_2_2();  // Twiggy Forager
    opponent_card_set[6] = new Monster_2_2();  // Twiggy Forager
    opponent_card_set[7] = new Monster_1_3();  // Mirkwood Weaver
    opponent_card_set[8] = new Monster_1_3();  // Mirkwood Weaver
    opponent_card_set[9] = new Monster_2_2();  // Twiggy Forager
}

function deck_construct_lvl2() {
    opponent_card_set[0] = new Monster_2_2();  // Twiggy Forager
    opponent_card_set[1] = new Monster_2_2();  // Twiggy Forager
    opponent_card_set[2] = new Monster_1_3();  // Mirkwood Weaver
    opponent_card_set[3] = new Monster_1_3();  // Mirkwood Weaver
    opponent_card_set[4] = new Monster_1_3();  // Mirkwood Weaver
    opponent_card_set[5] = new Monster_3_2();    //  Shade
    opponent_card_set[6] = new Monster_3_2();    //  Shade
    opponent_card_set[7] = new Monster_3_5();  // Howling Moonbeast
    opponent_card_set[8] = new Monster_Spiky(); // Thorned Mûmak
    opponent_card_set[9] = new Monster_3_2();    //  Shade
}

function deck_construct_lvl3() {
    opponent_card_set[0] = new Monster_3_2();    //  Shade
    opponent_card_set[1] = new Monster_3_2();    //  Shade
    opponent_card_set[2] = new Monster_3_5();  // Howling Moonbeast
    opponent_card_set[3] = new Monster_3_5();  // Howling Moonbeast
    opponent_card_set[4] = new Monster_5_5();  // Fire Drake
    opponent_card_set[5] = new Monster_Spiky(); // Thorned Mûmak
    opponent_card_set[6] = new Monster_Spiky(); // Thorned Mûmak
    opponent_card_set[7] = new Monster_3_3();  // Twilight Revenant
    opponent_card_set[8] = new Monster_3_3();  // Twilight Revenant
    opponent_card_set[9] = new Monster_3_2();    //  Shade
}

function deck_constructor_player_basic() {
    player_card_set[0] = new Monster_2_2();    // Twiggy Forager
    player_card_set[1] = new Monster_1_3();    // Mirkwood Weaver
    player_card_set[2] = new Monster_3_5();    // Howling Moonbeast
    player_card_set[3] = new Monster_3_2();    //  Shade
    player_card_set[4] = new Monster_1_3();    // Mirkwood Weaver
    player_card_set[5] = new Monster_3_3();    // Twiggy Forager
    player_card_set[6] = new Monster_3_2();    //  Shade
    player_card_set[7] = new Monster_3_3();    // Twilight Revenant
    player_card_set[8] = new Monster_Spiky();  // Thorned Mûmak
    player_card_set[9] = new Monster_unique(); // Unique card for the player
}



/* 
Level themes and styling ideas:

Level 1: "Fledgling Foes"
This level features the weakest monsters and serves as an introduction for the player to learn the game mechanics. 
The environment can be set in a dense forest, with towering trees and patches of sunlight shining through the leaves. 
Visuals can include animated plants, vines, and a gentle breeze rustling the leaves.

Level 2: "Shadowbound Showdown"
In this level, the player faces slightly stronger monsters with a mix of abilities. 
The setting can be a haunted graveyard or an abandoned village shrouded in darkness and fog. 
Visual elements to incorporate may include flickering torches, ghostly apparitions, and eerie whispers in the background.

Level 3: "Mythic Menace"
This level introduces the strongest and most challenging monsters. 
The backdrop can be a volcanic cavern or a mountain peak with a fierce storm raging around. 
Visual effects to consider include lava flows, lightning strikes, and powerful gusts of wind that sway the cards on the board.

By incorporating these visual themes, players can become more immersed in the game world and feel a sense of progression as they face increasingly challenging opponents.
*/
