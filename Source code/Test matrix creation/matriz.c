#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

/* Só tem decomposicao Cholesky se a matriz for simetrica definida positiva, ou seja, se os elementos da diagonal forem positivos (por ser simétrica).
A decomposicao de Cholesky é A = GGt, onde G é triangular inferior, com os elementos calculados como no caderno.
O sistema linear é calculado como Gy=b e Gtx = y*/

void imprimirMatriz(double *mat, double *B, int tam)
{
    int i, j;
    for(i = 0; i < tam; i++)
    {
        //for(j = 0; j < n-1; j++)
        for(j = 0; j < tam; j++)//for(j = 0; j < tam+1; j++)
        {
            //printf("%s %lf*x%lf ", ((j)?"+":""), dados[i][j], j);
            printf("%lf ", mat[i*tam+j]);
        }
        printf("%lf\n", B[i]);
        //printf("= %lf\n", dados[i][j]);
    }
}

int main()
{
    double *matT, *mat;
    int tam;
    int i, j, k;
    double *variaveis;

    srand(1);

    //scanf("%d %d", &tam, &tam);
    tam = 5000;

    mat = (double *)malloc(tam*tam*sizeof(double));
    matT = (double *)malloc(tam*tam*sizeof(double));
    variaveis = (double *)malloc((tam)*sizeof(double));


    fprintf(stderr, "Criando mat aleatoria\n");
    for(i = 0; i < tam; i++)
    {
        for(j = 0; j < tam; j++)
        {
            //scanf("%lf", (*(mat.dados + i) + j));
            matT[i*tam+j] = rand()%1000;
        }
    }
    fprintf(stderr, "Multiplicar mat por matT\n");
    #pragma omp parallel for private(j, k)
    for(i = 0; i < tam; i++)
    {
    		double *ptAuxMat;
    		ptAuxMat = (mat + i*tam);
        for(j = 0; j < tam; j++, ++ptAuxMat)
        {
            //fprintf(stderr, "i = %d, j = %d\n", i, j);

            *ptAuxMat = 0;
            for(k = 0; k < tam; k++)
            {
                *ptAuxMat += (matT[i*tam+k] * matT[j*tam+k]);
            }
        }
    }

    /*fprintf(stderr, "Multiplicar a diagonal por um valor\n");
    #pragma omp parallel for
    for(i = 0; i < tam; i++)
    {
        mat[i*tam+i] *= (tam*0.75);
    }*/
		fprintf(stderr, "Somar os elementos na diagonal\n");

    #pragma omp parallel for
    for(i = 0; i < tam; i++)
    {
    		for(j = 0; j < tam; j++)
    		{
    			if(i != j)
    				mat[i*tam+i] += mat[i*tam+j];
    		}
    }

    fprintf(stderr, "Achar o vetor B\n");
    for(i = 0; i < tam; i++)
    {
    //fprintf(stderr, "i = %d\n", i);
      *(variaveis + i) = 0;
      for(k = 0; k < tam; k++)
      {
          *(variaveis+i) += (*(mat+(i*tam+k)));
      }
    }

    fprintf(stderr, "Imprimindo\n");
    printf("%d\n", tam);
    //imprimirMatriz(matT, variaveis, tam);
    
    imprimirMatriz(mat, variaveis, tam);

    fprintf(stderr, "Liberando o espaço\n");
    free(mat);
    free(matT);
    free(variaveis);

    return 0;
}
