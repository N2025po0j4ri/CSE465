using System;

namespace hw9 {
	class hw9 {
		public static int Adder(params int[] numbers)
		{
			int sum = 0;
			
			foreach (int num in numbers) {
				sum += num;
			}
			
			return sum;
		}
		
		public static int Main(String [] args)
		{
			Console.WriteLine("Sum 1 is {0}", Adder(1,2,3,4,5,6));
			Console.WriteLine("Sum 2 is {0}", Adder(1,5));
			Console.WriteLine("Sum 3 is {0}", Adder());
			
			return 0;
		}
	}
}
