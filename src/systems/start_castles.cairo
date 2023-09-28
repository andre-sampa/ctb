// INITIALIZE CASTLES

// SOUTH CASTLE
#[system]
mod initiate_south_castle {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle,};


    fn execute(ctx: Context) {
        set!(
            ctx.world,
            (
                Castle {name: 'south', HP: 100},
            )
        );
        
    }
}

// NORTH CASTLE 
#[system]
mod initiate_north_castle {
    use array::ArrayTrait;
    use traits::Into;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle,};


    fn execute(ctx: Context) {
        set!(
            ctx.world,
            (
                Castle {name: 'north', HP: 100},
            )
        );
    }
}


// CASTELS TEST - Check new game integrity 
#[cfg(test)]
mod tests {
    use ctb_dojo::components::{Castle,};
    // CHECK NAME AND HP FOR BOTH CASTLES
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

