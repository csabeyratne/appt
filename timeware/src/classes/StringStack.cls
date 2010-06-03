public class StringStack {

	// Our Stack is implemented internally using a List of Strings.
	private List<String> stack;
	
	// Constructor
	public StringStack(){
	    stack = new List<String>();
	}
	
	public void push(String s){ 
		if (s == null) { throw new NullValueNotAllowedException(); }
		if (this.isFull()) { throw new StackOverflowException(); }
		stack.add(s); 
	}
	
	public String pop() { 
	    return stack.remove( stack.size() - 1 ); // Lists have a 0-based index.
	}

	// Helpers
	public static final Integer MAX_STACK_DEPTH = 1000;
	
	public Boolean isFull() { 
		return MAX_STACK_DEPTH == stack.size(); 
	}
	
	public Boolean isEmpty() { 
		return stack.isEmpty(); 
	}
	
	// Exception classes
	public class StackOverflowException extends Exception {}
	public class NullValueNotAllowedException extends Exception {}
	
}