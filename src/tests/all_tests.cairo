// // ALL_TESTS MODULE

// // TRIED TO GROUP ALL TESTS IN A SINGLE FILE 
// // TO SORT THE COMPILING ORDER.

// // THE CODE WORKS BUT TESTS DON'T RUN IN ORDER

// // KEEPING ALL AS COMMENTS 

// // TESTS:

// #[cfg(test)]
// mod tests {
//     use debug::PrintTrait;
//     use starknet::ContractAddress;
//     use ctb_dojo::components::GameSettings;
//     use ctb_dojo::components::{Castle, Player, PlayerTrait, PlayerTraitImpl };
//     // why we must specify each function and not just the entire mod system?
//     use ctb_dojo::systems::attack::attack_system::attack;
//     use ctb_dojo::systems::print_castle::print_castle_system::printCastle;
//     use ctb_dojo::systems::print_player::print_player_system::printPlayer;
//     use ctb_dojo::systems::start_lobby::start_lobby::start_lobby;
//     use ctb_dojo::systems::main::main_system::main;
//     use ctb_dojo::systems::random::random_system::random;


// // MAIN TEST
//     #[test]
//     #[available_gas(100000)]
//     fn main_test () {
//         main();
//         let x = 1;
//         assert(x ==1, 'x is not 1');
//     }
// // START LOBBY TEST
//     #[test]
//     #[available_gas(100000)]
//     fn start_lobby_test () {
//         start_lobby();
//         let x = 1;
//         assert(x ==1, 'x is not 1');
//     }


// // PLAYER TEST - NEW PLAYER CREATION AND PRINT TEST:
//     #[test]
//     #[available_gas(100000)]
//     fn player_test() {
//         let test_wallet = starknet::contract_address_const::<0x0>();
//         let test_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         //test_player.print();
//         assert(test_player.enrolled == true, 'player is not enrolled');
//     }

// // PLAYER SHARPEN TEST
//     #[test]
//     #[available_gas(100000)]
//     fn sharpen_test() {
//         let Name = 'Andre';
//         let test_wallet = starknet::contract_address_const::<0x01>();
//         let mut test_player = Player {enrolled: true, name: Name , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         assert(PlayerTrait::sharpen(ref test_player), 'not sharpened');
//     }

// // PRINT PLAYER TEST
//     #[test]
//     #[available_gas(100000)]
//     fn print_player_test() {
//         let test_wallet = starknet::contract_address_const::<0x0>();
//         let mut north_castle = Castle {name: 'north', HP: 100};
//         let mut new_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         printPlayer(new_player);
//         assert(new_player.name == 'Andre', 'wrong player name');
//     }

// // GAME SETTINGS TEST
//     #[test]
//     #[available_gas(100000)]
//     fn game_settings_test() {
//         let GAME_SETTINGS_ID: u32 = 1;
//         let id = 1;
//         let settings = GameSettings {game_settings_id: id,combat_cool_down:60};
//         assert(settings.game_settings_id == 1, 'id is not 1');
//     }


// // CASTELS TEST - CHECK NAME AND HP FOR BOTH CASTLES

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

// // PRINT CASTLE TEST 
//     #[test]
//     #[available_gas(100000)]
//     fn print_castle_test() {
//         let test_wallet = starknet::contract_address_const::<0x0>();
//         let mut new_castle = Castle {name: 'north', HP: 100};
//         printCastle(new_castle);
//         assert(new_castle.name == 'north', 'wrong castle name');
//     }


// // ATTACK TEST
//     #[test]
//     #[available_gas(100000)]
//     fn north_attack_test() {
//         let test_wallet = starknet::contract_address_const::<0x0>();
//         let mut north_castle = Castle {name: 'north', HP: 100};
//         let mut new_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         attack (new_player, ref north_castle);
//         printCastle(north_castle);
//         assert(north_castle.HP < 100, 'no damage');
//     }

//     #[test]
//     #[available_gas(100000)]
//     fn south_attack_test() {
//         let test_wallet = starknet::contract_address_const::<0x0>();
//         let mut south_castle = Castle {name: 'south', HP: 100};
//         let mut new_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         attack (new_player, ref south_castle);
//         printCastle(south_castle);
//         assert(south_castle.HP < 100, 'no damage');
//     }

//     // RANDOM FUNCTION TEST
//     #[test]
//     #[available_gas(100000)]
//     fn random_function_test() {
//         '----RANDOM FUNCTION TEST----'.print();
//         let mut x:u64 = 0;
//         x.print();
//         x = random();
//         x.print();
//         assert(x > 0 , 'x is 0');
//     }

// }



