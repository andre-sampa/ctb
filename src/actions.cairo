// TWEAKED DOJO_EXAMPLE
use starknet::{ContractAddress, get_caller_address};
use ctb_dojo::castle::{Castle, CastleFunction};


// define the interface
#[starknet::interface]
trait IActions<TContractState> {
    fn start_game(self: @TContractState);
    fn attack(self: @TContractState, ref castle: Castle);
    fn sharpen(self: @TContractState);
}

// declaring custom event struct
#[event]
#[derive(Drop, starknet::Event)]
enum Event {
    Attacked: Attacked,
}

// declaring custom event struct
#[derive(Drop, starknet::Event)]
struct Attacked {
    player: ContractAddress,
    castle: felt252
}

#[storage]
    struct Storage {        
        north_castle_hp: u128,
        south_castle_hp: u128
    }

// dojo decorator
#[dojo::contract]
mod actions {
    use starknet::{ContractAddress, get_caller_address};
    use debug::PrintTrait;
    use super::IActions;
    use ctb_dojo::castle::{Castle, CastleFunction};
    use ctb_dojo::random;


    // impl: implement functions specified in trait
    #[external(v0)]
    impl ActionsImpl of IActions<ContractState> {
        // ContractState is defined by system decorator expansion
        fn start_game (self: @ContractState){
            CastleFunction::start_castles();

        }

        fn attack (self: @ContractState, ref castle: Castle){

            if castle.name == 'north' {
            self.north_castle_hp.write(90);
            }
            if castle.name == 'south' {
            self.south_castle_hp.write(90);
            }
        }

        fn sharpen (self: @ContractState) {
              // Access the world dispatcher for reading.
            let world = self.world_dispatcher.read();

            // Get the address of the current caller, possibly the player's address.
            let player = get_caller_address();

         }

    }
}
