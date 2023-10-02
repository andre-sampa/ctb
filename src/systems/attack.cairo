// ATTACK_SYSTEM
#[system]
mod attack_system {
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle, Player,};
    use ctb_dojo::systems::random::random_system::random;


// ATTACK FUNCTION - Function for attack and damage
fn attack(player:Player, ref castle: Castle) {
    // Increase the attack damage by 25% 
    let sharpen_percent_increase = 25;
        // Check target castle
        if castle.name == 'north' {
            '---ATTACKING NORTH FUNCTION---'.print();
            'Show North HP'.print();
             castle.HP.print();
            'Attacking north'.print();
            let mut damage:u64 = random();
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
            let mut damage:u64 = random();
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
    use ctb_dojo::components::{Player, PlayerTrait};
    use ctb_dojo::components::{Castle,};
    // why we must specify each function and not just the entire mod system?
    use ctb_dojo::systems::attack::attack_system::attack;
    use debug::PrintTrait;
    use ctb_dojo::systems::print_castle::print_castle_system::printCastle;
    use ctb_dojo::systems::random::random_system::random;


    #[test]
    #[available_gas(100000)]
    fn north_attack_test() {
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut north_castle = Castle {name: 'north', HP: 100};
        let mut new_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
        attack (new_player, ref north_castle);
        printCastle(north_castle);
        assert(north_castle.HP < 100, 'no damage');
    }

    #[test]
    #[available_gas(100000)]
    fn south_attack_test() {
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut south_castle = Castle {name: 'south', HP: 100};
        let mut new_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
        attack (new_player, ref south_castle);
        printCastle(south_castle);
        assert(south_castle.HP < 100, 'no damage');
    }

    // RANDOM FUNCTION TEST
    #[test]
    #[available_gas(100000)]
    fn random_function_test() {
        '----RANDOM FUNCTION TEST----'.print();
        let mut x:u64 = 0;
        x.print();
        x = random();
        x.print();
        assert(x > 0 , 'x is 0');
    }
}

