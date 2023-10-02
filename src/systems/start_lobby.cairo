// START LOBBY AND WAIT FOR PLAYERS
#[system]
mod start_lobby {
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle, Player, Lobby};
    use ctb_dojo::systems::start_castles::initialize_castles::start_castles;


fn start_lobby() {
    let mut lobby = Lobby {id: 1, name: 'lobby1', ready: false};
    assert(lobby.id == 1, 'wrong lobby id');
    '---START LOBBY FUNCTION---'.print();
    
    // PLAYERS LIST ARRAY
    let mut players_list: Array<Player> = ArrayTrait::new();

    // CHECK PLAYER LIST LENGTH
    // if players_list.length() = 1 {
    //     lobby.ready = true;
    // }


    //FORCE ready = true FOR DEBUG
    lobby.ready = true;


    if lobby.ready == true {
        'Calling start_castle fn'.print();
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
