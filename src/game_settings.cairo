use debug::PrintTrait;
use array::ArrayTrait;
use starknet::ContractAddress;

/// @title: GAME SETTINGS
/// @notice: Define starting game variables
/// @dev: id, combat cooldown, number of players
#[derive(Model, Copy, Drop, Serde, SerdeLen)]
struct GameSettings {
    #[key]
    game_settings_id: u64,
    combat_cool_down: u64,
    players_number: u32,
}

// ---------------------------
// ---------- Tests ----------
// ---------------------------
#[cfg(test)]
mod tests {
    use ctb_dojo::player::{Player, PlayerFunction};
    use ctb_dojo::castle::{Castle, };
    use ctb_dojo::game_settings::GameSettings;

    // GAME SETTINGS TEST - Verify game id 
    #[test]
    #[available_gas(100000)]
    fn game_settings_test() {
        let id = 1;
        let cool_down = 60;
        let Players_number = 1;
        let settings = GameSettings {game_settings_id: id, combat_cool_down: cool_down, players_number: Players_number,};
        assert(settings.game_settings_id == 1, 'id is not 1');
    }
}