fn main() {
    println!("{}", one(thread_rng().gen()));
}

pub fn one(choice: bool) -> usize {
    if choice {
        1
    } else {
        2
    }
}

#[cfg(test)]
mod tests {
    use super::one;

    #[test]
    fn test_one() {
        assert_eq!(one(true), 1);
    }
}

use rand::{thread_rng, Rng};
