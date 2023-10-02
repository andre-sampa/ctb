// INITIALIZE CASTLES - Initialize north and south castles
#[system]
mod initialize_castles {
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle};


    fn start_castles () {
    
        let south_castle = Castle {name: 'south', HP: 100};
        let north_castle = Castle {name: 'north', HP: 100};
    
    }
}


// CASTELS TEST - CHECK NAME AND HP FOR BOTH CASTLES
#[cfg(test)]
mod tests {
    use ctb_dojo::components::Castle;
    use ctb_dojo::systems::initialize_castles::start_castles;
    #[test]
    #[available_gas(100000)]
    fn castles_test() {
        let test_south = Castle {name: 'south', HP: 100};
        assert(test_south.name == 'south', 'South castle name is wrong');
        assert(test_south.HP == 100, 'South HP not 100');
        let test_north = Castle {name: 'north', HP: 100};
        assert(test_north.name == 'north', 'North castle name is wrong');
        assert(test_north.HP == 100, 'South HP not 100');
    }
}
