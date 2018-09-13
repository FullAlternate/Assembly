// Copyright
// Laget av Johan, keiser av vidda og alle dets reinsdyr (og Jesper)
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/*
int *create_array(int n){
  int *prim = malloc(sizeof(int) * (n + 1));
  int i;
  // lager et array som inneholder alle tall fra og med 2 til og med n
  for (i = 2; i <= n; i++)
  {
    prim[i] = i;
  }
  return prim;
}
*/
// Funksjon som printer alle primtall som er mindre enn eller lik n
void sieveoferatosthenes(int *array, int array_length)
{
  int i;
  i = 2;
  
  // så lenge kvadratet av i er mindre eller lik n (vi trenger ikke å sjekke tall som er større enn det fordi når vi kommer til sqrt(n) så har vi funnet alle primtall)
  while ((i*i) <= array_length)
  {
    
    // sjekker om tallet allerede er fastslått som "ikke primtall"
    if (array[i] != 0)
    {
      // så lenge tallet kan ganges med et annet tall uten at produktet blir større enn n
      // da vet vi at prosuktet ikke er et primtall og vi kan da fjerne tallet fra arrayet
      for (int k = 2; k < array_length; k++)
      {
        int nonprim = array[i] * k;
        if (nonprim > array_length)
        {
          break;
        }
        else
          array[nonprim] = 0;
      }
    }
    i++;
  }

// printer arrayet som nå inneholder alle relevante primtall
  for (i = 2; i <= array_length; i++)
  {
    if (array[i] != 0)
    {
      printf("%d\n", array[i]);
    }
  }

}
/*
int assert_sieve(int *array, int array_length){
 
  for(int i = 2; i <= array_length; i++){
    for(int j = 2; j < i; j++){

      if(array[i] != 0 && array[i] % j == 0){
          return 0;
      }
    }
  }
  return 1;
  
}

// main for å teste funksjonen
int main()
{
  const int array_n = 100;
  int *x = create_array(array_n);

  sieveoferatosthenes(x, array_n);
  
  int result = assert_sieve(x, array_n);
  if(result == 0){
    printf("ERROR, non-prime number marked as prime\n");
  } else {
    printf("Success!\n");
  }
  return 0;
}
*/