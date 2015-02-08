#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


void buildBoard(int board[][5])
{
	int row, column;
	for(row=0 ; row <5 ; row++)
		for(column=0; column <5; column ++)
			board[row][column] = -1;
}

void displayBoard(int board[][5])
{
	int row, column;

	for (row= 0; row <5; row++)
	{
		if(row == 0) {
			printf("   1   2   3   4   5 \n");
			printf(" *-------------------*\n");
		}

		printf("%d|",row+1);

		for (column = 0; column <5 ; column++)
		{
			if(board[row][column]== -1)
			{
				printf("   |");
			} 
			else if (board[row][column]==0)
			{
				printf(" X |");
			} 
			else if (board[row][column]==1)
			{
				printf(" Y |");
			}
			
		}

		if(row == 4)  
			printf("\n *-------------------*\n");
		else
			printf("\n |---|---|---|---|---|\n");
	}
			
}
void makeShips(int ships[][2])
{
	srand(time(NULL));
	int ship, last;

	for(ship = 0 ; ship<3 ; ship++)
	{
		ships[ship][0] = rand() %5; 
		ships[ship][1] = rand() %5; 

		for(last=0; last < ship ; last++){
			if ((ships[ship][0] == ships[last][0])&& (ships[ship][1] == ships[last][1]))
				do
			{
					ships[ship][0] = rand()%5;
					ships[ship][1] = rand()%5; 

				}
				while( (ships[ship][0] == ships[last][0])&&(ships[ship][1] == ships[last][1]) );
		}
	}
}

/*
void shoot(int shot[2])
{
	int ans;
	printf("choose row: ");
	ans = scanf("%d", &shot[0]);
	shot[0]--; 

	printf("choose the column: ");
	scanf("%d", &shot[1]);
	shot[1]--;	
}
*/

void shoot (int shot[2]) {
	shot[0] = theRow();
	shot[0]--;
	shot[1] = column();
	shot[1]--;
}

int theRow() {
	int row;
	printf("Enter the row you would like to target: ");
	scanf("%d", &row);
	if (row > 5) {
		printf("Error: Out of range!\n");
		theRow();
	} 
	return row;
}

int column() {
	int col;
	printf("Enter the column you would like to target: ");
	scanf("%d", &col);
	if (col > 5) {
		printf("Error: Out of range!\n");
		column();
	}
	return col;
}

int hit(int shot[2], int ships[][2])
{
    int ship;

        for(ship=0 ; ship < 3 ; ship++){
            if( shot[0]==ships[ship][0] && shot[1]==ships[ship][1])
            {
                printf("boom (%d,%d)\n",shot[0]+1,shot[1]+1);
                return 1;
            }
        }
        return 0;
    }
 void tip(int shot[2], int ships[][2], int attempt)
 {
 	system("clear");
 	int row = 0;
 	int column =0;
 	int sub;

 	for(sub=0 ; sub <3 ; sub ++)
 	{
 		if (ships[sub][0] == shot[0])
 			row ++;
 		if (ships[row][1] == shot[1])
 			column++ ; 
 	}	
 	printf("\nturn %d: \nrow %d : %d ships\ncolumn %d : %d ships\n",attempt,shot[0]+1,row,shot[1]+1,column);

 }
 void refreshBoard(int shot[2], int ships[][2], int board[][5])
 {
        if(hit(shot,ships))
            board[shot[0]][shot[1]]=1;
        else
            board[shot[0]][shot[1]]=0;
    }


int main()
{
	system("clear");
	int board[5][5];
	int ships[3][2];
	int shot[2];
	int attempts = 0;
	int hits = 0;
	buildBoard(board);
	makeShips(ships);

	printf("\n");
	do 
	{ 	
		displayBoard(board);
		shoot(shot);
		attempts++;
		if (hit(shot,ships))
		{	
			tip(shot, ships, attempts);
			hits++ ;
		}
		else
			tip(shot, ships, attempts); 
			refreshBoard(shot,ships,board);

	}
	while (hits!=3);
	printf("\n finished. You hit all 3 ships in %d attempts", attempts);
	displayBoard(board);
}