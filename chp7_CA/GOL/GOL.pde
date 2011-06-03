// Daniel Shiffman, Nature of Code
// <http://www.shiffman.net>
 
// A basic implementation of John Conway's Game of Life CA
// how could this be improved to use object oriented programming?
// think of it as similar to our particle system, with a "cell" class
// to describe each individual cell and a "cellular automata" class
// to describe a collection of cells

int cellsize = 2;
int cols, rows;
// Game of life board
int[][] old_board, new_board;

void setup()
{
  size(200, 200);
  smooth();
  // Initialize rows, columns and set-up arrays
  cols = width/cellsize;
  rows = height/cellsize;
  old_board = new int[cols][rows];
  new_board = new int[cols][rows];
  // Call function to fill array with random values 0 or 1
  initBoard();
}

void draw() {
  background(255);

  // Loop through every spot in our 2D array and check spots neighbors
  for (int x = 0; x < cols;x++) {
    for (int y = 0; y < rows;y++) {
      int nb = 0;
      // Note the use of mod ("%") below to ensure that cells on the edges have "wrap-around" neighbors
      // above row
      if (old_board[(x+cols-1) % cols ][(y+rows-1) % rows ] == 1) { nb++; }
      if (old_board[ x                ][(y+rows-1) % rows ] == 1) { nb++; }
      if (old_board[(x+1)      % cols ][(y+rows-1) % rows ] == 1) { nb++; }
      // middle row
      if (old_board[(x+cols-1) % cols ][ y                ] == 1) { nb++; }
      if (old_board[(x+1)      % cols ][ y                ] == 1) { nb++; }
      // bottom row
      if (old_board[(x+cols-1) % cols ][(y+1)      % rows ] == 1) { nb++; }
      if (old_board[ x                ][(y+1)      % rows ] == 1) { nb++; }
      if (old_board[(x+1)      % cols ][(y+1)      % rows ] == 1) { nb++; }

      // RULES OF "LIFE" HERE
      if      ((old_board[x][y] == 1) && (nb <  2)) { new_board[x][y] = 0; }      //loneliness
      else if ((old_board[x][y] == 1) && (nb >  3)) { new_board[x][y] = 0; }      //overpopulation
      else if ((old_board[x][y] == 0) && (nb == 3)) { new_board[x][y] = 1; }      //reproduction
      else                                          { new_board[x][y] = old_board[x][y]; }  //stasis
    }
  }

  // RENDER game of life based on "new_board" values
  for ( int i = 0; i < cols;i++) {
    for ( int j = 0; j < rows;j++) {
      if ((new_board[i][j] == 1)) {
        fill(0);
        stroke(0);
        rect(i*cellsize,j*cellsize,cellsize,cellsize);
      }
    }
  }
  
  // Swap old and new game of life boards
  int[][] tmp = old_board;
  old_board = new_board;
  new_board = tmp;
}

// Init board with random "alive" squares
void initBoard() {
  background(0);
  for (int i =0;i < cols;i++) {
    for (int j =0;j < rows;j++) {
      if (int(random(2)) == 0) {
        old_board[i][j] = 1;
      } else {
        old_board[i][j] = 0;
      }
    }
  }
}

// reset board when mouse is pressed
void mousePressed() {
  initBoard();
}
