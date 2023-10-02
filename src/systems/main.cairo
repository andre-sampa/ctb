// MAIN START
#[system]
mod main_system {
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Player,};
    use ctb_dojo::systems::start_lobby::start_lobby::start_lobby;
    use ctb_dojo::systems::start_castles::initialize_castles::start_castles;
    use debug::PrintTrait;


fn main() {
    '---MAIN---'.print();
    // HOW DO WE CALL A SYSTEM IF WE LET EXECUTE FUNCTION?
    // THIS ONE IS WORKING BC WE GAVE THE FUNCTION A DIFFERENT NAME
    'Calling start_lobby fn'.print();
    start_lobby();

    }
}

// MAIN TEST - main() will call start_lobby() that will call start_castles()
#[cfg(test)]
mod tests {
    use ctb_dojo::systems::main::main_system::main;

    #[test]
    #[available_gas(100000)]
    fn main_test () {
        main();
    }

}
