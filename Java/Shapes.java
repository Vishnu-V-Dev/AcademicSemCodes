abstract class Sides {
	abstract int numOfSides();
}

class Rectangle extends Sides {
	@Override
	int numOfSides() {
		return 4;
	}
}
class Triangle extends Sides {
	@Override
	int numOfSides() {
		return 3;
	}
}
class Hexagon extends Sides {
	@Override
	int numOfSides() {
		return 6;
	}
}

class Shapes {
	public static void main(String args[]) {
		Sides rectangle= new Rectangle();
		Sides triangle= new Triangle();
		Sides hexagon= new Hexagon();
		
		System.out.println("Rectanle has "+rectangle.numOfSides()+" sides");
		System.out.println("Triangle has "+triangle.numOfSides()+" sides");
		System.out.println("Rectanle has "+hexagon.numOfSides()+" sides");
	}
}
