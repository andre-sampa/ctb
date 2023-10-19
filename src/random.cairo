use debug::PrintTrait;

// RANDOM FUNCTION - Not Ready

fn Random() -> u64 {
    '---RANDOM FUNCTION---'.print();
    let x:u64 = 20;
    x
}


// RANDOM FUNCTION TEST
#[cfg(test)]
mod tests {
    use debug::PrintTrait;
    use super::Random;
    #[test]
    #[available_gas(100000)]
    fn random_function_test() {
        '----CALLING RANDOM FUNCTION----'.print();
        let mut x:u64 = 0;
        x.print();
        x = Random();
        x.print();
    }
}

