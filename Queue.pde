import java.util.PriorityQueue;
import java.util.Comparator;

class comp implements Comparator<State> {
  int compare(State s1, State s2) {
   return new Integer(s1.getHue()).compareTo(s2.getHue()); 
  }
}
//class Queue extends PriorityQueue<State>{
//  Queue() {
//    //super();
    
//    super(0, new Comparator<State> {
//      int compare(State s1, State s2) {
//        return -1;
//      }
//    });
//    comp c = new comp();
//  }  
//}
