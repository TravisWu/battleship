#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// forward declarations
int theRow(); 
int rowCheck();
int column();
void shoot(int*);
void makeShips(int(*)[2]);
int main();


// buildBuild creates a 2d array to represent the game board
void buildBoard(int board[][5]) {
	int row;
	int column;
	for(row=0 ; row <5 ; row++) // create the 5 x 5 board
		for(column=0; column <5; column ++)
			board[row][column] = -1; // initialize board with -1
}

// displayBoard draws an ascii representation of the board
void displayBoard(int board[][5], int choice) {
	int row;
	int column;

	char* miss = " X |"; // game markers
	char* hit = " Y |";

	if (choice == 1) { // decide what game markers to use on the board
		miss = " O |";
		hit = " x |";		
	} else if (choice == 2) {
		miss = " M |";
		hit = " H |";		
	} else if (choice == 3) {
		miss = " 0 |";
		hit = " 1 |";		
	}

	for (row= 0; row <5; row++) {
		if(row == 0) { // print top of board
			printf("   1   2   3   4   5 \n"); 
			printf(" *-------------------*\n");
		}

		printf("%d|",row+1);

		for (column = 0; column <5 ; column++) { // print corrent symbol for current spot
			if(board[row][column]== -1)	{
				printf("   |");
			} 
			else if (board[row][column]==0)	{
				printf("%s",miss);
			} 
			else if (board[row][column]==1) {
				printf("%s",hit);
			}
		}

		if (row == 4)  // end of board, print bottom row
			printf("\n *-------------------*\n");
		else
			printf("\n |---|---|---|---|---|\n");
	}		
}

// makeShips creates three randomly placed "ships" on the board
void makeShips(int ships[][2]) {
	srand(time(NULL)); // seed random number generator
	int ship;
	int last;

	for(ship = 0 ; ship<3 ; ship++) {
		ships[ship][0] = rand() %5; // row
		ships[ship][1] = rand() %5; // column

		for(last=0; last < ship ; last++){ // make sure there are no duplicates
			if ((ships[ship][0] == ships[last][0])&& (ships[ship][1] == ships[last][1])){
				do { // if duplicates, try new ships
					ships[ship][0] = rand()%5; 
					ships[ship][1] = rand()%5; 

				}while ( (ships[ship][0] == ships[last][0])&&(ships[ship][1] == ships[last][1]) );
			}
		}
	}
}

// shoot function promts user to take a "shot"
void shoot (int shot[2]) {
	printf("Enter 0 at any time to restart or exit.\n");
	shot[0] = theRow();
	shot[0]--;
	shot[1] = column();
	shot[1]--;
}

// theRow captures input for the row coordinate 
int theRow() {
	int row; 
	int ta;
	int check;
	int info;
	printf("Enter the row you would like to target: ");
	check = scanf("%d", &row);

	if (check == 1) { // scanf found 1 integer
		if (row == 0) { // validate ipnut
			printf("\n Would you like to reset or exit? (1 for Reset, Any key for Exit) ");
			scanf("%d", &ta);
			if (ta == 1) {
				main();
			} else {
				printf("Thanks for playing!\n");
				exit(0);
			}
		}
		if ((row > 5) || (row < 1)) {
			printf("Out of range! You must choose between 1 and 5.\n");
			getchar();
			info = rowCheck();
			row = theRow();
		} 
	} else {// scanf didn't find anything
		printf("Not an integer! Please enter a number\n");
		getchar();
		row = theRow();
	}
	return row;// will return row if not conditions met above (sucess)
}

// theRow captures input for the row coordinate 
int column() {
	int col;
	int ta;
	int check;

	printf("Enter the column you would like to target: ");
	check = scanf("%d", &col);	
	if (check == 1) {// ensure scanf found 1 integer
		if (col == 0) { // validate ipnut
			printf("\n Would you like to reset or exit? (1 for Reset, Any key for Exit) ");
			scanf("%d", &ta);
			if (ta == 1) {
				main();
			} else {
				printf("Thanks for playing!\n");
				exit(0);
			}
		}
		if ((col > 5) || (col < 1)) {
			printf("Out of range! You must choose between 1 and 5.\n");
			col = column();
		}
	} else { // scanf didn't find anything
		printf("Not an integer! Please enter a number\n");
		getchar();
		col = column();
	}
	return col;// will return column if not conditions met above (sucess)
}

// hit will return 1/true if a shot hit a ship
int hit(int shot[2], int ships[][2]) {
	int ship;

    for(ship=0 ; ship < 3 ; ship++){ // check ships against the current shot
        if( shot[0]==ships[ship][0] && shot[1]==ships[ship][1]) {
            printf("Boom (%d,%d)\n",shot[0]+1,shot[1]+1);
            return 1;
        }
    }
    return 0;
}

// tip generates a "tip" for the user
void tip(int shot[2], int ships[][2], int attempt,int counter) {
	system("clear");
	int row = 0;
	int column =0;
	int sub;

	printf("You have %d attempts left.\n", (counter-attempt));
	// the number of ships in the current row or column is printed
	for(sub=0 ; sub <3 ; sub ++) {
		if (ships[sub][0] == shot[0])
			row++;
		if (ships[row][1] == shot[1])
			column++; 
	}	
	printf("\nTurn %d: \nRow %d : %d ships\nColumn %d : %d ships\n",(attempt+1),shot[0]+1,row,shot[1]+1,column);
}

// refreshBoard modifies the board 2d array apropriately
void refreshBoard(int shot[2], int ships[][2], int board[][5]) {
    if(hit(shot,ships))
        board[shot[0]][shot[1]]=1;
    else
        board[shot[0]][shot[1]]=0;
}

// program main function
int main() {
	int check;
	int choice;
	int counter = 0;
	
	// game setup
	system("clear");
	printf("Welcome to BattleShip!\n");
	printf("******** GAME SETUP ********\n");
	printf("How would you like hits to be represented\n1) X\n2) H\n3) 1\n4) Y\n ");
	printf("Enter option (1-4) or any key to exit:");
	check = scanf("%d", &choice);
	getchar();

	printf("\nEnter the maximum number of attempts allowed:");
	while (counter == 0){
		check = scanf("%d", &counter);
		if(check ==1){
			if(counter<4) {
				counter = 0;
				printf("Number too small; Please enter another number:");
			}
		}
		getchar();
	}

	// begin game process
	if ((choice == 1) || (choice == 2) || (choice == 3) || (choice == 4)) {
		system("clear");
		int board[5][5]; // declare game variables
		int ships[3][2];
		int shot[2];
		int attempts = 0;
		int hits = 0;
		int ta;
		buildBoard(board);// call game functions
		makeShips(ships);
		printf("You have %d attempts left.\n", (counter-attempts));
		printf("\n");
		do { // game loop

			displayBoard(board, choice);
			shoot(shot);
			attempts++;
			if (hit(shot,ships)) {	
				tip(shot, ships, attempts,counter);
				hits++ ;
			}else
				tip(shot, ships, attempts,counter); 

			refreshBoard(shot,ships,board);
			if (attempts == counter) { // exceeded max attempts
				printf ("Game Over!\n");
				printf("\n Would you like to try again? (1 for Yes, Any key for No) ");
				scanf("%d", &ta);
				if (ta == 1) {
					main(); // repeat game
				} else {
					printf("Thanks for playing!\n");
					exit(0);
				}
			}

		}while (hits!=3); // have not hit all 3 ships

		printf("\n Mazel Tov! You hit all 3 ships in %d attempts\n", attempts);
		displayBoard(board, choice);
		printf("\n Would you like to try again? (1 for Yes, Any key for No) ");
		scanf("%d", &ta);
		if (ta == 1) {
			main();
		} else {
			printf("Thanks for playing!\n");
			exit(0);
		}
	} else {
		printf("Thanks for playing!\n");
		exit(0);
	}
}

// rowCheck captures user input and checks for actions (exit,restart)
int rowCheck () {
	int rowAns;
	int reAns;
	printf ("Do you wish to continue, reset or exit the game? (1 for Yes, 2 for Reset and Any key to Continue)\n");
		scanf ("%d", &rowAns);
		if (rowAns == 1) {
			printf("Thanks for playing!\n");
			exit(0);
		}
		else if (rowAns == 2) {
			printf("Are you sure you want to restart the game? (1 for Yes, Any key for No)\n");
			scanf ("%d", &reAns);
			if (reAns == 1) {
				main();
			}
		}
		getchar();
}