
/*
 * CS515 Assignment 3
 * imagestack.cpp
 * John Dokoupil
 */

#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;

void BubbleSort( int* array , int size );

int main ( int argc , char** argv )
{
	// create ofstream
	ofstream outFile ( argv[argc-1] );

	// check for correct number of images
	if ( argc < 3 )
	{
		cout << "invalid number of arguments" << endl;
		exit(1);
	}

	// create ifstream
	ifstream inFile ( argv [1] );

	// collect file header info
	string s;
	inFile >> s;
	int width;
	inFile >> width;
	int height;
	inFile >> height;
	int maxGray;
	inFile >> maxGray;

	// dynamically create 3D array
	int*** imageArr = new int**[argc-2];
	for ( int i = 0 ; i < argc-2 ; i++ )
	{
		imageArr[i] = new int*[height];
		for ( int j = 0 ; j < height ; j++ )
		{
			imageArr[i][j] = new int[width];
		}
	}

	// import data from first image to array
	for ( int i = 0 ; i < height ; i++ )
	{
		for ( int j = 0 ; j < width ; j++ )
		{
			inFile >> imageArr[0][i][j];
		}
	}

	// import data from remaining images to array
	for ( int i = 2 ; i < argc-1 ; i++ )
	{
		ifstream inFile( argv[i] );
		inFile >> s;
		inFile >> width;
		inFile >> height;
		inFile >> maxGray;
		for ( int j = 0 ; j < height ; j++ )
		{
			for ( int k = 0 ; k < width ; k++ )
			{
				inFile >> imageArr[i-1][j][k];
			}
		}

	}

	// dynamically create array for filtered image output file
	int** newImageArr = new int*[height];
	for ( int i = 0 ; i < height ; i++ )
	{
		newImageArr[i] = new int[width];
	}

	// filtering alogorithm
	for ( int i = 0 ; i < height ; i++ )
	{
		for ( int j = 0 ; j < width ; j++ )
		{	// temp is the array of values at that pixel location in all images
			int* temp = new int[argc-2];
			for ( int k = 0 ; k < argc-2 ; k++ )
			{
				temp[k] = imageArr[k][i][j];
			}
			BubbleSort ( temp , argc-2 );
			int median = ( argc-2 )/2;
			newImageArr[i][j] = temp[median];
			delete[] temp;
		}
	}

	// write header for output file
	outFile << s << endl << width << " " << height << endl << maxGray << endl;

	// write image data to output file
	for ( int i = 0 ; i < height ; i++ )
	{
		for ( int j = 0 ; j < width ; j++ )
		{
			outFile << newImageArr[i][j] << " ";
		}
		outFile << endl;
	}

	// garbage collection: deleting all dynamically allocated memory
	for ( int i = 0 ; i < height ; i++ )
	{
		delete[] newImageArr[i];
	}
	delete[] newImageArr;

	for ( int i = 0 ; i < argc-2 ; i++ )
	{
		for ( int j = 0 ; j < height ; j++ )
		{
			delete[] imageArr[i][j];
		}
		delete[] imageArr[i];
	}
	delete[] imageArr;
}


// this function was taken from another source
// mentioned in my collaboration declaration
void BubbleSort( int* array , int size )
{
      int i, j, flag = 1;    // set flag to 1 to start first pass
      int temporary;             // holding variable
      int numLength = size;
      for(i = 1; (i <= numLength) && flag; i++)
     {
          flag = 0;
          for (j=0; j < (numLength -1); j++)
         {
               if (array[j+1] > array[j])      // ascending order simply changes to <
              {
                    temporary = array[j];             // swap elements
                    array[j] = array[j+1];
                    array[j+1] = temporary;
                    flag = 1;               // indicates that a swap occurred.
               }
          }
     }
     return;   //arrays are passed to functions by address; nothing is returned
}
