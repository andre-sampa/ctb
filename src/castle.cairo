use debug::PrintTrait;
use array::ArrayTrait;
use starknet::ContractAddress;
use ctb_dojo::player::{Player, PlayerFunctions};
use ctb_dojo::combat::combat_system;


/// CASTLE - Define Castle Attributes
#[derive(Model, Copy, Drop, Serde, SerdeLen)]
struct Castle {
    #[key]
    name: felt252,
    HP: u64,
}

/// -----LEARNING NOTE------
// CHECK WHY WE CAN'T MAKE player.print() and castle.print() to work
// PRINT CASTLE IMPLEMENTATION - Implement a Castle print to PrintTrait<>
// CHECK WHY WE MUST CHANGE NAME, A BUG SAYS PlayerCastleImpl IS DEFINED MULTIPLE TIMES

#[generate_trait]
impl CastleFunctions of CastleTrait {
    /// @title: PRINT CASTLE
    /// @notice: Print a castle and it's properties
    /// @dev: Usefull for debug
    /// @param: Castle's method (Castle.print_castle())
    /// @return: none
    fn print_castle(self: Castle) {
        '---PRINTING CASTLE---'.print();
        'NAME:'.print();
        self.name.print();
        'HP:'.print();
        self.HP.print();
    }

    /// @title: START CASTLES
    /// @notice: Initialize two castles, North and South
    /// @dev: Simulates an attack after castles are initialized
    /// @param: none
    /// @return: none
    fn start_castles () {
        '----START CASTLES FUNCTION----'.print();
        let mut south_castle = Castle {name: 'south', HP: 100};
        let mut north_castle = Castle {name: 'north', HP: 100};
        south_castle.print_castle();
        CastleFunctions::print_castle(north_castle);

        '---CONGRATS, THE GAME IS ON!---'.print();

        '---ATTACK TEST!---'.print();
        '---calling sharpen function---'.print();
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut test_player = PlayerFunctions::new ('Andre', test_wallet);
        test_player.sharpen();
        combat_system::attack (test_player, ref south_castle);
    }
}


// ---------------------------
// ---------- Tests ----------
// ---------------------------
#[cfg(test)]
mod tests {

    use ctb_dojo::castle::{Castle, CastleFunctions};
    use debug::PrintTrait;

    #[test]
    #[available_gas(100000)]
    fn castle_test() {
        '---CASTLE TEST---'.print();
        let test_south = Castle {name: 'south', HP: 100};
        assert(test_south.name == 'south', 'South castle name is wrong');
        assert(test_south.HP == 100, 'South HP not 100');
        test_south.print_castle();
        let test_north = Castle {name: 'north', HP: 100};
        assert(test_north.name == 'north', 'North castle name is wrong');
        assert(test_north.HP == 100, 'South HP not 100');


    }
}