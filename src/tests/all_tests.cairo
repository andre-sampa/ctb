// ALL_TESTS MODULE

// A TEST TO GROUP ALL TESTS IN A SINGLE FILE AND 
// TRY TO SORT THE COMPILING ORDER.

// THE CODE WORKS BUT TESTS DON'T RUN IN ORDER

// ALSO, IS PROBABLY BETTER TO HAVE TESTS INSIDE COMPONENTS CODE 
// TO BE ABLE TO CHECK FUNCTIONS AND VARIABLES

// Leaving all as comment for the moment.

// TESTS:

// #[cfg(test)]
// mod tests {
//     use ctb_dojo::components::{Player, PlayerTrait};
//     use ctb_dojo::components::{Castle,};
//     use ctb_dojo::systems::attack_system::attack;
//     use ctb_dojo::components::GameSettings;

// // Game settings TEST
//     #[test]
//     #[available_gas(100000)]
//     fn game_settings_test() {
//         let GAME_SETTINGS_ID: u32 = 1;
// d = 1;
//         let settings = GameSettings {game_settings_id: id,combat_cool_down:60};
//         assert(settings.game_settings_id == 1, 'id is not 1');
//     }

// // Player Sharpen TEST
//     #[test]
//     #[available_gas(100000)]
//     fn sharpen_test() {
//         let Name = 'Andre';
//         let test_wallet = starknet::contract_address_const::<0x01>();
//         let mut test_player = Player {enrolled: true, name: Name , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         assert(PlayerTrait::sharpen(ref test_player), 'not sharpened');
//     }

// // Attack TEST
//     #[test]
//     #[available_gas(100000)]
//     fn attack_test() {
//         let Name = 'Andre';
//         let test_wallet = starknet::contract_address_const::<0x0>();
//         let mut north_castle = Castle {name: 'north', HP: 100};
//         let mut new_player = Player {enrolled: true, name: Name , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         attack (new_player, ref north_castle);
//         assert(north_castle.HP < 100, 'no damage');
//         // assert (attack (new_player, ref north_castle), 'no damage');
//     }

// // Castels TEST
//     #[test]
//     #[available_gas(100000)]
//     fn castles_test() {
//         let test_south = Castle {name: 'south', HP: 100};
//         assert(test_south.name == 'south', 'South castle name is wrong');
//         assert(test_south.HP == 100, 'South HP not 100');
//         let test_north = Castle {name: 'north', HP: 100};
//         assert(test_north.name == 'north', 'North castle name is wrong');
//         assert(test_north.HP == 100, 'South HP not 100');
//     }


// }


