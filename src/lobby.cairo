use debug::PrintTrait;
use array::ArrayTrait;
use starknet::ContractAddress;
use ctb_dojo::game_settings::GameSettings;
use ctb_dojo::player::{Player, PlayerFunctions};
use ctb_dojo::castle::{Castle, CastleFunctions};

// LOBBY
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Lobby {
    #[key]
    id: u64,
    name: felt252,
    // DOJO CURRENTLY DOES NOT SUPPORT ARRAYS HERE
    // players_list: Array<u64>,
    ready: bool,

}

#[generate_trait]
impl LobbyFunctions of LobbyTrait {
    /// @title - LOBBY FUNCTIONS
    /// @notice - Initialize a lobby
    /// @dev - It will check for players list lenght and set lobby as ready when 
    /// players number is achieved. 
    /// @param - GameSettings
    /// @return - none
    fn start_lobby(game_settings: GameSettings) {
    // CREATE LOBBY STRUCT 
    '---START LOBBY FUNCTION---'.print();
    let mut lobby = Lobby {id: 1, name: 'lobby1', ready: false};
    assert(lobby.id == 1, 'wrong lobby id');
    '---Checking players list---'.print();
    // PLAYERS LIST ARRAY
    let mut players_list: Array<Player> = ArrayTrait::new();
    let test_wallet = starknet::contract_address_const::<0x0>();
    let mut test_player = PlayerFunctions::new ('Andre', test_wallet);
    players_list.append(test_player);
    

    // CHECK PLAYER LIST LENGTH
    let x = players_list.len();
        if x == game_settings.players_number {
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
            CastleFunctions::start_castles();
        }
    
    }

}


// START LOBBY TEST
#[cfg(test)]
mod tests {
    use super::LobbyFunctions;
    use ctb_dojo::game_settings::GameSettings;

    #[test]
    #[available_gas(200000)]
    fn start_lobby_test () {
        let id = 1;
        let cool_down = 60;
        let Players_number = 1;
        let settings = GameSettings {game_settings_id: id, combat_cool_down: cool_down, players_number: Players_number,};
        LobbyFunctions::start_lobby(settings);
        let x = 1;
        assert(x ==1, 'x is not 1');
    }
}
