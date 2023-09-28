// COMPONENTS:
// CHECK IF WE NEED TO BREAK DOWN COMPONENTS ON SMALLER FILES

// IMPORT REFERENCES - Import used libraries 
use debug::PrintTrait;
use starknet::ContractAddress;

// CASTLE - Define Castle Attributes
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Castle {
    #[key]
    name: felt252,
    HP: u64,
}

// PLAYER - Define Player attributes
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Player {
    #[key]
    enrolled: bool,
    name: felt252,
    wallet: ContractAddress,
    sharp: bool,
    attack_damage: u64,
}


// SHARPEN FUNCTION - Define a Player Trait for '!sharpen' command 
// Player.sharpen
trait PlayerTrait {
    fn sharpen (ref self: Player) -> bool;

}

impl PlayerTraitImpl of PlayerTrait {
    fn sharpen (ref self: Player) -> bool {
    '---!SHARPEN COMMAND---'.print();
        if self.sharp == false {
           self.attack_damage = 15;
           'Your sword is now sharpened.'.print();
           'The blacksmith did a great job.'.print();
           'Ready for war, my Lord!'.print();
           self.sharp = true;
           return (self.sharp);
        } else {
            let message: felt252 = 'Your sword is already sharpened'; // if we add one more character we get felt252 error, check it out later
            message.print(); 
            self.sharp = false;
            return (self.sharp);
           
        }
    }
}

// PRINT PLAYER IMPLEMENTATION - Implement a player print to PrintTrait<>
// CHECK WHY WE MUST CHANGE NAME, A BUG SAYS PlayerPrintImpl IS DEFINED MULTIPLE TIMES
impl PlayerPrintImpl_AAA of PrintTrait<Player> {
    fn print(self: Player) {
        '---PRINTING PLAYER---'.print();
        'ENROLLED:'.print();
        self.enrolled.print();
        'NAME:'.print();
        self.name.print();
        'WALLET:'.print();
        self.wallet.print();
        'SHARPENED:'.print();
        self.sharp.print();
        'ATTACK DAMAGE:'.print();
        self.attack_damage.print();
    }
}

// GAME SETTINGS - Define starting game variables
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct GameSettings {
    #[key]
    game_settings_id: u32,
    combat_cool_down: u32,
}


// TESTS:
#[cfg(test)]
mod tests {
    // IMPORT TEST REFERENCES
    use ctb_dojo::components::{Player, PlayerTrait};
    use ctb_dojo::components::{Castle,};
    use ctb_dojo::systems::attack_system::attack;
    use ctb_dojo::components::GameSettings;

    // GAME SETTINGS TEST - Verify game id 
    #[test]
    #[available_gas(100000)]
    fn game_settings_test() {
        let id = 1;
        let cool_down = 60;
        let settings = GameSettings {game_settings_id: id,combat_cool_down: cool_down};
        assert(settings.game_settings_id == 1, 'id is not 1');
    }

    // PLAYER SHARPEN TEST - Verify player.sharpen bool 
    #[test]
    #[available_gas(100000)]
    fn sharpen_test() {
        let Name = 'Andre';
        let test_wallet = starknet::contract_address_const::<0x01>();
        let mut test_sharpen_player = Player {enrolled: true, name: Name , wallet: test_wallet, sharp: false, attack_damage: 10,};
        assert(PlayerTrait::sharpen(ref test_sharpen_player), 'not sharpened');
    }


}

