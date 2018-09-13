#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Declaring that assembly function is provided elsewhere
extern void asm_function();

// Dataset to array transformer
int *DA_transformer(char *dataset) {

	// Reads the size header of dataset and stores it in size_s
	FILE *the_set = fopen(dataset, "r");
	char size_s[100];
	
	fscanf(the_set, "%s", size_s);

	// Converts the arraysize string to integer and initializes the array
	int size = atoi(size_s);	//Atoi is responsible for string -> int converting

	//printf("total array length: %d\n", size);

	int *data_array = malloc(sizeof(int) * size);

	// Pumps data from file to array
	for(int i = 0; i <= size; i++) {
		fscanf(the_set, "%s", size_s);
		
		int value = atoi(size_s);
		data_array[i] = value;

		//printf("%d\n", data_array[i]);
	}
	
	//printf("array element check: %d\n", data_array[99999]);

	return data_array;
}


// This should be the C equivalent to the assembly implementation
/*void sieve_function() {
	int prim[n + 1];
  	int i = 1;
	prim[3] = i;

  	// lager et array som inneholder alle tall fra og med 2 til og med n
	for (i = 2; i <= n; i++)
	{
		prim[i] = i;
	}

	i = 2;
	// så lenge kvadratet av i er mindre eller lik n (vi trenger ikke å sjekke tall som er større enn det fordi når vi kommer til sqrt(n) så har vi funnet alle primtall)
	while ((i*i) <= n)
	{
		// sjekker om tallet allerede er fastslått som "ikke primtall"
		if (prim[i] != 0)
		{
		// så lenge tallet kan ganges med et annet tall uten at produktet blir større enn n
		// da vet vi at prosuktet ikke er et primtall og vi kan da fjerne tallet fra arrayet
		for (int k = 2; k < n; k++)
		{
			int nonprim = prim[i] * k;
			if (nonprim > n)
			{
			break;
			}
			else
			prim[nonprim] = 0;
		}
		}
		i++;
	}

// printer arrayet som nå inneholder alle relevante primtall
  for (i = 2; i <= n; i++)
  {
    if (prim[i] != 0)
    {
      printf("%d\n", prim[i]);
    }
  }

}

void assert_sieve(int *array){
	
}
*/
int main(int argc, char **argv) {

	/* Start here */
	asm_function();
	//sieve_function();
	

}
