#[system]
mod start_lobby {
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle, Player, Lobby};


fn start_lobby() {
    let lobby = Lobby {id: 1, name: 'lobby1', ready: false};
    assert(lobby.id == 1, 'wrong lobby id');
    '---START LOBBY FUNCTION---'.print();
    let mut players_list: Array<Player> = ArrayTrait::new();

}

}

// START LOBBY TEST
#[cfg(test)]
mod tests {
    use super::start_lobby::start_lobby;
    #[test]
    #[available_gas(100000)]
    fn start_lobby_test () {
        start_lobby();
        let x = 1;
        assert(x ==1, 'x is not 1');
    }
}
