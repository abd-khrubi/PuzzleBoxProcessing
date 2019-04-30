class AI {
   
}

class Wrapper {
  Wrapper(State state, IntList path) {
    
  }
}


//class AI {
//  AI() {
//  }

//  int getNextMove(State state, int maxDepth) {
//    int moveIdx = -1;
//    PriorityQueue<State> q = new PriorityQueue(new comp());
//    ArrayList<State> closed = new ArrayList<State>();
//    q.add(state);
//    while (maxDepth-- != 0 && !q.isEmpty()) {
//      println("Closed:", closed);
//      println("Open:", q);
//      State currentState = q.poll();
//      closed.add(currentState);
//      if (currentState.getHue() == 0) {
//        return getFirstMove(currentState);
//      } else {
//        for (Block move : currentState.possibleMoves()) {
//          println("Moves: ", currentState.possibleMoves());
//          Board board = state.board.clone();
//          board.handleClick(move);
//          State s = new State(board, currentState, move.idx);
//          if (!closed.contains(s)) {
//            q.add(s);
//          }
//        }
//      }
//    }

//    println("Closed:", closed);
//    println("Open:", q);
//    return moveIdx;
//  }

//  int getFirstMove(State state) {
//    while (state.lastState != null) {
//      state = state.lastState;
//    }
//    print("(F)");
//    return state.move;
//  }

//  int getNextMove(State state) {
//    return getNextMove(state, 22);
//  }
//}
