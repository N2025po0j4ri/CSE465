public class hw9 {
    
    // adder method that accepts a variable number of arguments
    public static int adder(int... numbers) {
        int sum = 0; // Initialize sum to 0
        for (int num: numbers) {
          sum += num;
        }
        return sum;
    }

    public static void main(String[] args) {
        // Test cases with different numbers of arguments
        System.out.println("Sum 1 is " + adder(1, 2, 3, 4, 5, 6)); // Sum: 21
        System.out.println("Sum 2 is " + adder(1, 5));              // Sum: 6
        System.out.println("Sum 3 is " + adder());                  // Sum: 0
    }
}
