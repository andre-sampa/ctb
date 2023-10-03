// START LOBBY AND WAIT FOR PLAYERS
#[system]
mod start_lobby {
    use array::ArrayTrait;
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle, Player, Lobby, GameSettings};
    use ctb_dojo::systems::start_castles::initialize_castles::start_castles;
    use ctb_dojo::systems::random::random_system::random;


fn start_lobby(game_settings: GameSettings) {
    // CREATE LOBBY STRUCT 
    '---START LOBBY FUNCTION---'.print();
    let mut lobby = Lobby {id: 1, name: 'lobby1', ready: false};
    assert(lobby.id == 1, 'wrong lobby id');
    '---Checking players list---'.print();
    // PLAYERS LIST ARRAY
    let mut players_list: Array<Player> = ArrayTrait::new();
    let test_wallet = starknet::contract_address_const::<0x0>();
    let mut test_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
    players_list.append(test_player);
    

    // CHECK PLAYER LIST LENGTH
   // let x = players_list.len();
    if players_list.len() == game_settings.players_number {
        '---Lobby ready---'.print();
        '---STARTING GAME!---'.print();
        lobby.ready = true;
    }
    else {
        '---WAITING FOR PLAYERS----'.print();
        '---LOBBY IS NOT READY---'.print()
    }

    // CHECK READY STATUS AND START CASTLES
    if lobby.ready == true {
        '---Calling start_castle fn---'.print();
        start_castles();
    }

}

}

// // START LOBBY TEST
// #[cfg(test)]
// mod tests {
//     use super::start_lobby::start_lobby;
//     #[test]
//     #[available_gas(100000)]
//     fn start_lobby_test () {
//         start_lobby();
//         let x = 1;
//         assert(x ==1, 'x is not 1');
//     }
// }
