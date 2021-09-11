
/*
 * CS515 Assignment 3
 * image.cpp
 * John Dokoupil
 */

#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;

int main ( int argc , char** argv )
{
	// check number of arguments
	if ( argc != 4 )
	{
		cout << "wrong number of arguments" << endl;
		exit(1);
	}
	
	// check that input image is valid
	ifstream inFile ( argv[1] );
	if ( ! inFile )
	{
		cout << "not a valid image file" << ": " << argv[1] <<  endl;
		exit(1);
	}
	
	// create ofstreams
	ofstream negFile ( argv[2] );
	ofstream rotFile ( argv[3] );
	
	// capture "P2", width, height, and grayscale of image
	string s;
	inFile >> s;
	int width;
	inFile >> width;
	int height;
	inFile >> height;
	int maxGray;
	inFile >> maxGray;

	// create array for original image
	int** imageArr = new int*[height];
	for ( int i = 0 ; i < height ; i++ )
		imageArr[i] = new int[width];
	// populate array for original image
	for ( int i = 0 ; i < height ; i++ )
		for ( int j = 0 ; j < width ; j++ )
			inFile >> imageArr[i][j];
	
	// create array for negative image
	int** negativeArray = new int*[height];
	for ( int i = 0 ; i < height ; i++ )
		negativeArray[i] = new int[width];
	// populate array for negative image	
	for ( int i = 0 ; i < height ; i++ )
		for ( int j = 0 ; j < width ; j++ )
			negativeArray[i][j] = 255 - imageArr[i][j];
			
	// create array for rotated image		
	int** rotatedArray = new int*[width];
	for ( int i = 0 ; i < width ; i++ )
		rotatedArray[i] = new int[height];
	// populate array for rotated image	
	for ( int i = 0 ; i < width ; i++ )
		for ( int j = 0 ; j < height ; j++ )
			rotatedArray[i][j] = imageArr[j][width-1-i];
	
	// provide output files with properly formatted headers
	negFile << s << endl << width << " " << height << endl << maxGray << endl;
	rotFile << s << endl << height << " " << width << endl << maxGray << endl;
	
	// write negative image array to output file & delete array
	for ( int i = 0 ; i < height ; i++ )
	{
		for ( int j = 0 ; j < width ; j++ )
			{
				negFile << negativeArray[i][j] << " ";
			}
		negFile << endl;
		delete[] negativeArray[i];
	}
	delete[] negativeArray;
	
	// write rotated image array to output file & delete array
	for ( int i = 0 ; i < width ; i++ )
	{
		for ( int j = 0 ; j < height ; j++ )
		{
			rotFile << rotatedArray[i][j] << " ";
		}
		rotFile << endl;
		delete[] rotatedArray[i];
	}
	delete[] rotatedArray;
	
	// delete original image array
	for ( int i = 0 ; i < height ; i++ )
		delete[] imageArr[i];
	delete[] imageArr;
}
