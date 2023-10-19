/// ATTACK_SYSTEM
#[system]
mod attack_system {
    use debug::PrintTrait;
    use starknet::ContractAddress;
    use ctb_dojo::player::Player;
    use ctb_dojo::castle::Castle;
    use ctb_dojo::random;


/// @title - ATTACK FUNCTION
/// @notice - Function for attack and damage
/// @dev - The function checks if sharpen is true and increase damage eventualy. 
/// @param - Player, Castle
/// @return - none
fn attack(player:Player, ref castle: Castle) {
    // Eventual sharpen damage % increase
    let sharpen_percent_increase = 25;
        // Check target castle
        if castle.name == 'north' {
            '---ATTACKING NORTH FUNCTION---'.print();
            'Show North HP'.print();
             castle.HP.print();
            'Attacking north'.print();
            let mut damage:u64 = random::Random(5);
                if player.sharp == true {
                    damage = damage + ((damage * sharpen_percent_increase) / 100);
                }
            'Show attack damage'.print();
            damage.print();
            castle.HP = castle.HP - damage;
            'Show final North HP:'.print();
            castle.HP.print();
        }
        if castle.name == 'south' {
            '---ATTACKING SOUTH FUNCTION---'.print();
            'Show South HP'.print();
             castle.HP.print();
            'Attacking south'.print();
            let mut damage:u64 = random::Random(5);
                if player.sharp == true {
                    damage = damage + ((damage * 25) / 100);
                }
            'Show attack damage'.print();
            damage.print();
            castle.HP = castle.HP - damage;
            'Show final South HP:'.print();
            castle.HP.print();
        }

    }

}



// ATTACK TEST - Create a new player and a castle to verify attack and damage
#[cfg(test)]
mod tests {
    use ctb_dojo::player::{Player, PlayerFunctions};
    use ctb_dojo::castle::{Castle, CastleFunctions};
    use ctb_dojo::random;
    use ctb_dojo::attack::attack_system;
    use debug::PrintTrait;


    #[test]
    #[available_gas(100000)]
    fn north_attack_test() {
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut north_castle = Castle {name: 'north', HP: 100};
        let mut new_player = PlayerFunctions::new ('Andre', test_wallet);
        attack_system::attack (new_player, ref north_castle);
        CastleFunctions::print_castle(north_castle);
        assert(north_castle.HP < 100, 'no damage');
    }

    #[test]
    #[available_gas(100000)]
    fn south_attack_test() {
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut south_castle = Castle {name: 'south', HP: 100};
        let mut new_player = PlayerFunctions::new ('Andre', test_wallet);
        attack_system::attack (new_player, ref south_castle);
        CastleFunctions::print_castle(south_castle);
        assert(south_castle.HP < 100, 'no damage');
    }

    // RANDOM FUNCTION TEST
    #[test]
    #[available_gas(100000)]
    fn random_function_test() {
        '----RANDOM FUNCTION TEST----'.print();
        let mut x:u64 = 0;
        x.print();
        x = random::Random(5);
        x.print();
        assert(x > 0 , 'x is 0');
    }
}

